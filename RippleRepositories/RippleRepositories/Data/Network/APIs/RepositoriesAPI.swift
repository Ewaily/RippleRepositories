//
//  RepositoriesAPI.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Alamofire
import SwiftyJSON

protocol RepositoriesAPIProtocol {
    func search(query: String,
                completion: @escaping (Result<SearchResponseDTO, String>) -> Void)
}

struct RepositoriesAPI: BaseAPI {
}

// MARK: - RepositoriesAPIProtocol

extension RepositoriesAPI: RepositoriesAPIProtocol {
    
    func search(query: String,
                completion: @escaping (Result<SearchResponseDTO, String>) -> Void) {
        #if REMOTE
        request(request: RepositoriesRouter.search(query: query)) { result in
            switch result {
            case .success(let json):
                let searchResults = SearchResponseDTO(json: json)
                completion(.success(searchResults))
            case .failure(let error):
                completion(.failure(error.localizedDescription))
            }
        }
        #else
        guard let data = DataMocks.searchResponse else { return }
        completion(.success(.init(json: JSON(data))))
        #endif
    }
}
