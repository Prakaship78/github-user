//
//  GHUserDetailsView.swift
//  GithubUser
//
//  Created by Prakash on 15/08/25.
//

import SwiftUI

struct GHUserDetailsView: View {
    var userName : String
    @State var vm = GHUserDetailsViewModel()
    @EnvironmentObject var favourite : Favourites
    
    var body: some View {
        Group {
            if vm.isLoading {
                ProgressView()
                
            }else {
                VStack(alignment: .leading,spacing: 16) {
                    // MARK: Name card
                    GHUserHeaderView(imageUrl: vm.userDetails.avatarUrl, name: vm.userDetails.name, userName: vm.userDetails.login)
                    // MARK: Details View
                    if ((vm.userDetails.bio?.isEmpty) == nil) {
                        Text(vm.userDetails.bio ?? "")
                    }
                    
                    IconCountView(count: "\(vm.userDetails.publicRepos)", description: "Public repos", imageName: "book")
                    
                    IconCountView(count: "\(vm.userDetails.followers)", description: "followers", imageName: "person.2.fill")
                    
                    IconCountView(count: "\(vm.userDetails.following)", description: "following",imageName: "person.crop.circle.badge.plus" )
                    
                    IconCountView(count: "", description: vm.userDetails.createdAt.formatDate ?? "", imageName: "calendar.badge.clock")
                    // Add to aFavourite
                    Button {
                        // Add to favourite button
                        let user = GHFollower(login: vm.userDetails.login, avatarUrl: vm.userDetails.avatarUrl)
                        favourite.add(user)
                    } label: {
                        HStack {
                            Image(systemName: "star.circle")
                            Text("Add to favourite")
                            
                        }
                        .foregroundStyle(Color.primary)
                    }
                    
                    /// Repository Button
                    NavigationLink {
                        GHRepositoryListView(repoUrl: vm.userDetails.reposUrl)
                    } label: {
                            HStack {
                                Image(systemName: "text.book.closed")
                                Text("Repositories")
                                Spacer()
                                Image(systemName: "chevron.forward")
                            }
                        }
                    .buttonStyle(.bordered)
                    .foregroundStyle(Color.primary)


                    Spacer()
                    
                    
                }.padding(.all,16)
                
            }
            
        }
        .navigationTitle("Profile details")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await vm.fetchUserDetails(username: userName)
        }
    }
}

#Preview {
    GHUserDetailsView(userName: "prakash")
}
