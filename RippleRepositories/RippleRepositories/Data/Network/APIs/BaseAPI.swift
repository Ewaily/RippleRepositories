//
//  BaseAPI.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Alamofire
import SwiftyJSON

protocol BaseAPI { }

extension BaseAPI {
    
    func request(request: URLRequestConvertible,
                        completion: @escaping (Result<JSON, AFError>) -> Void) {
        AF.request(request).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
