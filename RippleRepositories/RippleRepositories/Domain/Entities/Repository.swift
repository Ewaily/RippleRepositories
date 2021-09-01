//
//  Repository.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import Foundation

struct Repository: Equatable {
    static func ==(lhs: Repository, rhs: Repository) -> Bool {
        return lhs.repoName == rhs.repoName && lhs.repoURL == rhs.repoURL
    }
    
    let repoName            : String
    let repoDescription     : String
    let ownerAvatarURL      : URL?
    let repoURL             : URL?
}
