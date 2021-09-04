//
//  ListRepositoriesUseCase.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

protocol ListRepositoriesUseCaseProtocol {
    func fetchRepositories(query: String, completion: @escaping (Result<[Repository], String>) -> Void)
    func cacheRepositories(repositories: [Repository], completion: @escaping () -> Void)
    func fetchCachedRepositories(completion: @escaping (Result<[Repository], String>) -> Void)
}

struct ListRepositoriesUseCase: ListRepositoriesUseCaseProtocol {
        
    private let repository: ListRepositoriesRepositoryProtocol
    
    init(repository: ListRepositoriesRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchRepositories(query: String, completion: @escaping (Result<[Repository], String>) -> Void) {
        repository.fetchRepositories(query: query, completion: completion)
    }
    
    func cacheRepositories(repositories: [Repository], completion: @escaping () -> Void) {
        repository.cacheRepositories(repositories: repositories, completion: completion)
    }
    
    func fetchCachedRepositories(completion: @escaping (Result<[Repository], String>) -> Void) {
        repository.fetchCachedRepositories(completion: completion)
    }
}
