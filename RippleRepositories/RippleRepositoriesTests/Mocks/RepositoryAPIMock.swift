//
//  RepositoryAPIMock.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 01/09/2021.
//

@testable import RippleRepositories
import Foundation
import SwiftyJSON

struct RepositoriesAPIMock: RepositoriesAPIProtocol {
    
    func search(query: String, completion: @escaping (Result<SearchResponseDTO, String>) -> Void) {
        guard let data = DataMocks.searchResponse else { return }
        completion(.success(.init(json: JSON(data))))
    }
}
