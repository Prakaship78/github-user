//
//  NetworkManager.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.github.com/users/"
    
    // Get list of all followers for a user
    func getFollower(for username : String, page : Int) async throws -> [GHFollower] {
        let urlString = baseURL + "\(username)/followers?per_page=10&page=\(page)"
        guard let url = URL(string: urlString) else {throw GHError.invalidUsername }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw GHError.invalidResponse}
        
        do {
            let decoder = JSONDecoder()
            let users = try decoder.decode([GHFollower].self, from: data)
            return users
        } catch {
            print(error.localizedDescription)
            throw GHError.invalidData
        }
    }
    
    // get user details of a user
    func getUserDetails(for username : String) async throws -> GHUser {
        let urlString = baseURL + username
        guard let url = URL(string: urlString) else {throw GHError.invalidUsername }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw GHError.invalidResponse}
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let users = try decoder.decode(GHUser.self, from: data)
            return users
        } catch {
            print(error.localizedDescription)
            throw GHError.invalidData
        }
    }
    
    // get list of repos list for a user
    func getUserRepos(urlString : String) async throws -> [GHRepository] {
        guard let url = URL(string: urlString) else {throw GHError.generic }
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw GHError.invalidResponse}
        
        do {
            let decoder = JSONDecoder()
            let repos = try decoder.decode([GHRepository].self, from: data)
            return repos
        } catch {
            print(error.localizedDescription)
            throw GHError.invalidData
        }
    }
    
}
