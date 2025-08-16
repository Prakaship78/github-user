//
//  GHUserHeaderView.swift
//  GithubUser
//
//  Created by Prakash on 16/08/25.
//

import SwiftUI
import Kingfisher

struct GHUserHeaderView: View {
    let imageUrl : String
    let name : String?
    let userName : String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: 100,height: 100)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text(name ?? "")
                    .font(.system(size: 28,weight: .bold))
                Text(userName ?? "")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            
        }
    }
}

#Preview {
    GHUserHeaderView(imageUrl: "", name: "", userName: "")
}
