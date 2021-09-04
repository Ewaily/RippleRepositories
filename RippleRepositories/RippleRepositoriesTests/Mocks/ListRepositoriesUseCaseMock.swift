//
//  ListRepositoriesUseCaseMock.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 04/09/2021.
//

import Foundation
@testable import RippleRepositories

struct ListRepositoriesUseCaseMock: ListRepositoriesUseCaseProtocol {
    
    private let repository: ListRepositoriesRepositoryProtocol = ListRepositoriesRepositoryMock(mock: RepositoriesAPIMock())
    
    func fetchRepositories(query: String = "", completion: @escaping (Result<[Repository], String>) -> Void) {
        repository.fetchRepositories(query: query, completion: completion)
    }
    
    func cacheRepositories(repositories: [Repository], completion: @escaping () -> Void) {
        repository.cacheRepositories(repositories: repositories, completion: completion)
    }
    
    func fetchCachedRepositories(completion: @escaping (Result<[Repository], String>) -> Void) {
        repository.fetchCachedRepositories(completion: completion)
    }
    
}
