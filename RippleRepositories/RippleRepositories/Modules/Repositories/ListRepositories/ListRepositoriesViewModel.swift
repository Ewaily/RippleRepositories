//
//  ListRepositoriesViewModel.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol ListRepositoriesViewModelOutput {
    func getRepositoryInfo(at index: Int) -> Repository
    func countRepositories() -> Int
    func fetchRepositories(completion: @escaping () -> Void)
    var navigateToItemDetails: PublishSubject<Repository> { get set }
    func cacheLatestRepositories(completion: @escaping () -> Void)
    func fetchCachedRepositories(completion: @escaping () -> Void)
    func fetchLiveRepositories(completion: @escaping () -> Void)
}

protocol ListRepositoriesViewModelInput {
    func didRepoAtIndexPath(_ indexPath: IndexPath)
}

class ListRepositoriesViewModel: ListRepositoriesViewModelOutput, ListRepositoriesViewModelInput {
    
    let query: String
    private let useCase = ListRepositoriesUseCase()
    var repositories: BehaviorRelay<[Repository]> = .init(value: [])
    var navigateToItemDetails: PublishSubject<Repository> = .init()
    
    init(query: String) {
        self.query = query
    }
    
    func getRepositoryInfo(at index: Int) -> Repository {
        let repository = repositories.value[index]
        return Repository(repoName: repository.repoName,
                          repoDescription: repository.repoDescription,
                          ownerAvatarURL: repository.ownerAvatarURL, repoURL: repository.repoURL)
    }
    
    func countRepositories() -> Int {
        return repositories.value.count
    }
    
    func fetchLiveRepositories(completion: @escaping () -> Void) {
        useCase.fetchRepositories(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let repositories):
                self.repositories.accept(repositories)
                if self.repositories.value.isEmpty {
                    completion()
                }
                else {
                    self.cacheLatestRepositories(completion: completion)
                }
            case .failure(let error):
                completion()
                print(error)
            }
        }
    }
    
    func didRepoAtIndexPath(_ indexPath: IndexPath) {
        let model = repositories.value[indexPath.row]
        navigateToItemDetails.onNext(model)
    }
    
    func cacheLatestRepositories(completion: @escaping () -> Void) {
        useCase.cacheRepositories(repositories: self.repositories.value, completion: completion)
    }
    
    func fetchCachedRepositories(completion: @escaping () -> Void) {
        useCase.fetchCachedRepositories { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let repositories):
                self.repositories.accept(repositories)
                if self.repositories.value.isEmpty {
                    completion()
                }
                else {
                    self.cacheLatestRepositories(completion: completion)
                }
            case .failure(let error):
                completion()
                print(error)
            }
        }
    }
    
    func fetchRepositories(completion: @escaping () -> Void) {
        if ReachabilityManager.isReachable() {
            self.fetchLiveRepositories(completion: completion)
        }
        else {
            self.fetchCachedRepositories(completion: completion)
        }
    }
}
