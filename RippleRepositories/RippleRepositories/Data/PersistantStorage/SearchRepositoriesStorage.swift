//
//  SearchRepositoriesStorage.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 01/09/2021.
//

import Foundation

struct SearchRepositoriesStorage {
    
    private let latestQueriesKey = "repositories_latest_queries"
    private let userDefault = UserDefaults.standard
    
    func cacheRepositories(repositories: [Repository]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(repositories)

            // Write/Set Data
            userDefault.set(data, forKey: latestQueriesKey)
            userDefault.setValue(true, forKey: Constants.isCachedQueriesKey)

        } catch {
            userDefault.setValue(false, forKey: Constants.isCachedQueriesKey)
            print("Unable to Encode Note (\(error))")
        }
    }
    
    func getCachedRepositories() -> [Repository]? {
        if let data = userDefault.data(forKey: latestQueriesKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let photos = try decoder.decode([Repository].self, from: data)
                
                return photos
                
            } catch {
                print("Unable to Decode Notes (\(error))")
                return nil
            }
        }
        else {
            return nil
        }
    }
}
