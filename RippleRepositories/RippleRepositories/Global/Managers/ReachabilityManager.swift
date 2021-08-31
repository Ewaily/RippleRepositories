//
//  ReachabilityManager.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Alamofire

struct ReachabilityManager {
    
    static func isReachable() -> Bool {
        let status = NetworkReachabilityManager()?.isReachable ?? false
        return status
    }
}
