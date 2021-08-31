//
//  Result.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)
}
