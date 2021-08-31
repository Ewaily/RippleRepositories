//
//  NetworkConstants.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

struct NetworkConstants {
    
    static let BASE_URL = "https://api.github.com/"
    
    enum ContentType: String {
        case json = "application/json"
    }
    
    struct HTTPHeader {
        static let content_type  = "Content-Type"
        static let acceptType    = "Accept"
    }
    
    struct  APIResource {
        static let search   = "search/"
    }
    
    struct  EndPoint {
        static let repositories   = "repositories"
    }
    
    struct Parameters {
        static let query            = "q"
        static let name             = "name"
        static let owner            = "owner"
        static let avatarURL       = "avatar_url"
        static let description      = "description"
        static let items            = "items"
    }
}
