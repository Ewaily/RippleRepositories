//
//  SearchResponseDTO.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import SwiftyJSON

struct SearchResponseDTO {
    let repositories    : [RepositoryDTO]
    
    init(json: JSON) {
        repositories    = json[NetworkConstants.Parameters.items].arrayValue.compactMap( { RepositoryDTO(json: $0) } )
    }
}

struct RepositoryDTO {
    let repoName            : String
    let repoDescriptionn    : String
    let ownerAvatarURL      : URL?
    let repoURL             : URL?
    
    init(json: JSON) {
        repoName            = json[NetworkConstants.Parameters.name].stringValue
        repoDescriptionn    = json[NetworkConstants.Parameters.description].stringValue
        ownerAvatarURL      = json[NetworkConstants.Parameters.owner][NetworkConstants.Parameters.avatarURL].url
        repoURL      = json[NetworkConstants.Parameters.htmlURL].url
        
    }
    
    func toDomain() -> Repository {
        return Repository(repoName: repoName, repoDescription: repoDescriptionn, ownerAvatarURL: ownerAvatarURL, repoURL: repoURL)
    }
}
