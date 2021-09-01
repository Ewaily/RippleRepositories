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
}
