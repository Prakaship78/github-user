//
//  GHTabView.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct GHTabView: View {
    var body: some View {
        TabView {
            Tab("Search", systemImage: "magnifyingglass.circle.fill") {
                SearchView()
            }
            
            Tab("Favourites", systemImage: "star.circle.fill") {
                FavouritesView()
            }
        }
    }
}

#Preview {
    GHTabView()
}
