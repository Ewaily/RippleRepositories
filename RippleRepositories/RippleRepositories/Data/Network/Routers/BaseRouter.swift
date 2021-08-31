//
//  BaseRouter.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Alamofire

protocol BaseRouter: URLRequestConvertible {
    var method        : HTTPMethod { get }
    var path          : String { get }
    var headers       : [String : String]? { get }
    var parameters    : Parameters? { get }
}

extension BaseRouter {
    
    var deviceID: String {
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
            fatalError("identifierForVendor could not be retrieved")
        }
        return deviceID
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkConstants.BASE_URL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        var encoding: ParameterEncoding
        urlRequest.httpMethod = method.rawValue
        
        if let headers = headers {
            for header in headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        if let parameters = parameters {
            if method == .get {
                encoding = URLEncoding.default
            }
            else {
                encoding = JSONEncoding.default
            }
            do {
                urlRequest = try encoding.encode(urlRequest, with: parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
