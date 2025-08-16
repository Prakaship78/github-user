//
//  FollowersViewModel.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

@Observable
final class FollowersViewModel {
    var searchText = ""
    var isLoading = false
    var alertItem : AlertItem?
    var navigateToFollowersList = false
    
    var followersData : [GHFollower] = []
    var page = 1
    var hasMoreData = true
    
    
    // Fetch list of followers
    func fetchUsers(isReset : Bool = false) async -> Bool {
        if isReset { /// Reset flag to call api 1st time or reset all data
            page = 1
            hasMoreData = true
            followersData.removeAll()
        }
        
        /// Only call api if previous api call is finished and has more data
        if isLoading || !hasMoreData {return false}
        isLoading = true
        defer {
            isLoading = false
        }
        
        do {
            let data = try await NetworkManager.shared.getFollower(for: searchText, page: page)
            followersData.append(contentsOf: data)
            if data.count == 10 {/// only increment page if count == 10 , means more data is present
                page += 1
            }else {
                hasMoreData = false /// data is less than 10 means no more data present no need to call paging api
            }
            return true
        }catch let error as GHError {
            alertItem = error.alertItem
            return false
        }catch {
            // no need to handle this
            print("error \(error.localizedDescription)")
            return false
        }
    }
}
