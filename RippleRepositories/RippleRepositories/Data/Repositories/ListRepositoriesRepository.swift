//
//  ListRepositoriesRepository.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

struct ListRepositoriesRepository {
    
    let remoteSource = RepositoriesAPI()
    
    func fetchRepositories(query: String, completion: @escaping (Result<[Repository], String>) -> Void) {
        remoteSource.search(query: query) { result in
            switch result {
            case .success(let repositoriesSearchDTO):
                let repositories = repositoriesSearchDTO.repositories.compactMap( { $0.toDomain()} )
                completion(.success(repositories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
