//
//  FavouriteViewModel.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import Foundation


final class Favourites : ObservableObject{
    @Published var favouriteUsers : [GHFollower] = []
    
    func add(_ user : GHFollower){ 
        favouriteUsers.append(user)
    }
    
    func deleteUser(at offsets : IndexSet){
        favouriteUsers.remove(atOffsets: offsets)
    }
    
    
}
