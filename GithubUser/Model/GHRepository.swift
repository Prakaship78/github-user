//
//  GHRepository.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import Foundation

struct GHRepository : Identifiable,Decodable{
    let id = UUID()
    let name : String
    let description : String?
    let stargazersCount : Int
    let forksCount : Int
    
    private enum CodingKeys : String, CodingKey {
        case name = "name"
        case description = "description"
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
    }
}
