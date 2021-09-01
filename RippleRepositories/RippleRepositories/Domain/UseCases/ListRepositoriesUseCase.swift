//
//  ListRepositoriesUseCase.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

struct ListRepositoriesUseCase {
    
    private let repository = ListRepositoriesRepository(remote: RepositoriesAPI())
    
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
