//
//  FavouritesView.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favourite : Favourites
    
    var body: some View {
        NavigationStack{
            Group {
                if favourite.favouriteUsers.isEmpty {
                    Text("No data added")
                }else {
                    List{
                        ForEach(favourite.favouriteUsers) { user in
                            GHListTileView(avatarUrl: user.avatarUrl, userName: user.login)
                        }
                        .onDelete { indexSet in
                            favourite.deleteUser(at: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Favourites")
        }
        
        
    }
}

#Preview {
    FavouritesView()
}
