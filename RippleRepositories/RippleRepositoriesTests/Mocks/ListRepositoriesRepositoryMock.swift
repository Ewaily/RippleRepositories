//
//  ListRepositoriesRepositoryMock.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 04/09/2021.
//

import Foundation
@testable import RippleRepositories

struct ListRepositoriesRepositoryMock: ListRepositoriesRepositoryProtocol {
    
    let mockSource: RepositoriesAPIProtocol
    private let cacheSource: SearchRepositoriesStorage = SearchRepositoriesStorage()
    
    init(mock: RepositoriesAPIProtocol) {
        self.mockSource = mock
    }
    
    func fetchRepositories(query: String, completion: @escaping (Result<[Repository], String>) -> Void) {
        mockSource.search(query: query) { result in
            switch result {
            case .success(let repositoriesSearchDTO):
                let repositories = repositoriesSearchDTO.repositories.compactMap( { $0.toDomain()} )
                completion(.success(repositories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func cacheRepositories(repositories: [Repository], completion: @escaping () -> Void) {
        cacheSource.cacheRepositories(repositories: repositories)
        completion()
    }
    
    func fetchCachedRepositories(completion: @escaping (Result<[Repository], String>) -> Void) {
        if let cachedRepositories = cacheSource.getCachedRepositories() {
            completion(.success(cachedRepositories))
        }
        else {
            completion(.failure("Error"))
        }
    }
    
}
