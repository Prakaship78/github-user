//
//  GHRepositoryListViewModel.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import Foundation

@Observable
final class GHRepositoryListViewModel {
    var isLoading = false
    var alertItem : AlertItem?
    var userRepos : [GHRepository] = []
    
    // get repository list
    func getUserRepos(urlStr : String) async {
        isLoading = true
        defer {isLoading = false}
        
        do {
            let data = try await NetworkManager.shared.getUserRepos(urlString: urlStr)
            userRepos = data
        }catch let error as GHError {
            alertItem = error.alertItem
            print(error.localizedDescription)
        }catch {
            print(error.localizedDescription)
        }
    }
}
