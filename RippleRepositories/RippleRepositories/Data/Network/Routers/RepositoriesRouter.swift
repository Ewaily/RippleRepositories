//
//  RepositoriesRouter.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation
import Alamofire

enum RepositoriesRouter: BaseRouter {
    
    case search(query: String)
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "\(NetworkConstants.APIResource.search)\(NetworkConstants.EndPoint.repositories)"

        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .search(let query):
            return [NetworkConstants.Parameters.query : query]
        }
    }
}
