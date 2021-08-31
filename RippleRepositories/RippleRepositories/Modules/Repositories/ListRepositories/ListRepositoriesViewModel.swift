//
//  ListRepositoriesViewModel.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

protocol ListRepositoriesViewModelOutput {
    func getRepositoryInfo(at index: Int) -> Repository
    func countRepositories() -> Int
    func fetchRepositories(completion: @escaping () -> Void)
}

protocol ListRepositoriesViewModelInput {
}

class ListRepositoriesViewModel: ListRepositoriesViewModelOutput, ListRepositoriesViewModelInput {
    
    let query: String
    private let useCase = ListRepositoriesUseCase()
    private var repositories: [Repository] = []
    
    init(query: String) {
        self.query = query
    }
    
    func getRepositoryInfo(at index: Int) -> Repository {
        let repository = repositories[index]
        return Repository(repoName: repository.repoName,
                                  repoDescription: repository.repoDescription,
                                  ownerAvatarURL: repository.ownerAvatarURL)
    }
    
    func countRepositories() -> Int {
        return repositories.count
    }
    
    func fetchRepositories(completion: @escaping () -> Void) {
        useCase.fetchRepositories(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let repositories):
                self.repositories = repositories
                print(repositories)
                completion()
            case .failure(let error):
                completion()
                print(error)
            }
        }
    }
}
