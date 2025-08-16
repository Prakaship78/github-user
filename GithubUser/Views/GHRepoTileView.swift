//
//  GHRepoTileView.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import SwiftUI

struct GHRepoTileView: View {
    let title : String
    let description : String
    let starCount : Int
    let forkCount : Int
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(title)
                .font(.system(size: 20,weight: .bold))
            Text(description)
                .font(.system(size: 16,weight: .medium))
                .foregroundStyle(Color.secondary)
            HStack {
                HStack{
                    Image(systemName: "star")
                    Text("\(starCount) stars")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
                Spacer()
                HStack{
                    Image(systemName: "document.on.document")
                    Text("\(forkCount) forks")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                }
            }
            
        }
    }
}

#Preview {
    GHRepoTileView(title: "repo anme", description: "description", starCount: 20, forkCount: 10)
}
