//
//  GHRepositoryListView.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import SwiftUI

struct GHRepositoryListView: View {
    let repoUrl : String
    @State var vm = GHRepositoryListViewModel()
    
    var body: some View {
        Group {
            if vm.isLoading {
                ProgressView()
            }else if vm.userRepos.count == 0 {
                Text("No data found")
            } else {
                List(vm.userRepos){repo in
                    GHRepoTileView(title: repo.name, description: repo.description ?? "", starCount: repo.stargazersCount, forkCount: repo.forksCount)
                }
            }
        }
        .navigationTitle("Repository")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await vm.getUserRepos(urlStr: repoUrl)
        }
        .alert(item: $vm.alertItem) { alert in
            Alert(title: alert.title, message: alert.message,dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    GHRepositoryListView(repoUrl: "")
}
