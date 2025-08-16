//
//  GHUser.swift
//  GithubUser
//
//  Created by Prakash on 15/08/25.
//

import Foundation

struct GHUser : Decodable {
    let login : String
    let avatarUrl : String
    let name : String?
    let bio : String?
    let publicRepos : Int
    let followers : Int
    let following : Int
    let createdAt : String
    let reposUrl : String
}
