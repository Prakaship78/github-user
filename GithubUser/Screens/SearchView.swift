//
//  SearchView.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct SearchView: View {
    @State var vm = FollowersViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image(.ghLogo)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.bottom,20)
                    
                    TextField("Search username", text: $vm.searchText)
                        .padding(.horizontal,32)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.search)
                        .onSubmit {
                            // api call
                            Task {
                                let status = await vm.fetchUsers(isReset: true)
                                if status {
                                    vm.navigateToFollowersList = true
                                }
                            }
                        }
                        
                }
                
                GHLoadingView(isLoading: vm.isLoading)
            }
            .alert(item: $vm.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
            }
            .navigationDestination(isPresented: $vm.navigateToFollowersList) {
                GHListView(vm: $vm, userName: vm.searchText)
            }
        }
    }
}

#Preview {
    SearchView()
}
