//
//  GHListView.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct GHListView: View {
    @Binding var vm : FollowersViewModel // since both shares a same api call and no extra functionality
    var userName : String
    
    
    var body: some View {
        VStack {
            if vm.followersData.isEmpty {
                Text("No users data found")
            }else {
                List(vm.followersData){ data in
                    NavigationLink {
                        GHUserDetailsView(userName: data.login)
                    } label: {
                        GHListTileView(avatarUrl: data.avatarUrl, userName: data.login)
                    }
                    
                    .onAppear{
                        if data.id == vm.followersData.last?.id , vm.hasMoreData {
                            Task {
                                await vm.fetchUsers()
                            }
                        }
                    }
                    
                }
            }
            
        }
        .navigationTitle(userName)
        .navigationBarTitleDisplayMode(.large)
        .alert(item: $vm.alertItem) { alert in
            Alert(title: alert.title,message: alert.message,dismissButton: alert.dismissButton)
        }
        
    }
}

#Preview {
    GHListView(vm : .constant(FollowersViewModel()), userName: "Prakash")
}
