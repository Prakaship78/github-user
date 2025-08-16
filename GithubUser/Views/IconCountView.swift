//
//  IconCountView.swift
//  GithubUser
//
//  Created by Prakash on 15/08/25.
//

import SwiftUI

struct IconCountView: View {
    let count : String
    let description : String
    let imageName : String
    var body: some View {
        HStack{
            Image(systemName: imageName)
            
            Text(count)
                .font(.system(size: 15,weight: .bold))
            +
            Text(" \(description)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    IconCountView(count: "567", description: "followers", imageName: "person.2.fill")
}
