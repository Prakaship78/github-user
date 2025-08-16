//
//  GHFollower.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import Foundation

struct GHFollower : Codable, Identifiable {
    var id = UUID() // to differentiate in listView
    var login : String
    var avatarUrl : String
    
    private enum CodingKeys : String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
    
}
