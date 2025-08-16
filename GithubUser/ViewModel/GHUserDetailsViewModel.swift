//
//  GHUserDetailsViewModel.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import Foundation

@Observable
final class GHUserDetailsViewModel{
    var isLoading = false
    var alertItem : AlertItem?
    /// Set default value to make it non optional
    var userDetails : GHUser = GHUser(login: "", avatarUrl: "", name: "", bio: "", publicRepos: 0, followers: 0, following: 0, createdAt: "", reposUrl: "")
    
    /// Fetch user details
    func fetchUserDetails(username : String)async{
        isLoading = true
        defer { isLoading = false } /// make loading false in all cases (Success,error)
        
        do {
            let data = try await NetworkManager.shared.getUserDetails(for: username)
            userDetails = data
            
        } catch let error as GHError {
            print(error.localizedDescription)
            alertItem = error.alertItem
        }catch {
            print(error.localizedDescription)
        }
    }
    
    /// add to favourite
    func addToFavourite(_ env : Favourites){
        
    }
}
