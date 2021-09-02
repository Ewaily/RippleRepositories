//
//  DataMocks.swift
//  RippleRepositoriesTests
//
//  Created by Muhammad Ewaily on 01/09/2021.
//

import Foundation

enum DataMocks {
    
    static let searchResponse: Data? = readLocalFile(forName: "ReposSearchResponse")
    
    static private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
