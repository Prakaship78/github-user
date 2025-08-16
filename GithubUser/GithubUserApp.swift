//
//  GithubUserApp.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

@main
struct GithubUserApp: App {
    var favourites = Favourites()
    var body: some Scene {
        WindowGroup {
            GHTabView()
                .environmentObject(favourites)
        }
    }
}
