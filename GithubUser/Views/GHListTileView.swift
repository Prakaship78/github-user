//
//  GHListTileView.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI
import Kingfisher

struct GHListTileView: View {
    let avatarUrl : String
    let userName : String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            KFImage(URL(string: avatarUrl))
                .placeholder({
                    ProgressView()
                })
                .resizable()
                .frame(width: 100,height: 100)
                .scaledToFit()
                .cornerRadius(12)
                
             
            
            Text(userName)
                .font(.headline)
            

        }
    }
}

#Preview {
    GHListTileView(avatarUrl: "https://avatars.githubusercontent.com/u/8217532?v=4", userName: "prakash")
}
