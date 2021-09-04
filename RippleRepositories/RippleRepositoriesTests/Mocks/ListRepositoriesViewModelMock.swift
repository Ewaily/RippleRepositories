//
//  ListRepositoriesViewModelMock.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 04/09/2021.
//

import Foundation
import RxCocoa
import RxSwift
import SwiftyJSON


@testable import RippleRepositories

struct ListRepositoriesViewModelMock: ListRepositoriesViewModelProtocol {
    
    let query = "ripple"
    private let useCase: ListRepositoriesUseCaseProtocol = ListRepositoriesUseCaseMock()
    
    var repositories: BehaviorRelay<[Repository]> = .init(value: [])
    
    init() {
        repositories.accept(SearchResponseDTO(json: JSON(DataMocks.searchResponse!)).repositories.compactMap({$0.toDomain()}))
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
    
    func fetchRepositories(completion: @escaping () -> Void) {
        if ReachabilityManager.isReachable() {
            self.fetchLiveRepositories(completion: completion)
        }
        else {
            self.fetchCachedRepositories(completion: completion)
        }
    }
    
    var navigateToItemDetails: PublishSubject<Repository> = .init()
    
    func cacheLatestRepositories(completion: @escaping () -> Void) {
        useCase.cacheRepositories(repositories: self.repositories.value, completion: completion)
    }
    
    func fetchCachedRepositories(completion: @escaping () -> Void) {
        useCase.fetchCachedRepositories {  result in
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
    
    func fetchLiveRepositories(completion: @escaping () -> Void) {
        useCase.fetchRepositories(query: query) { result in
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
}
