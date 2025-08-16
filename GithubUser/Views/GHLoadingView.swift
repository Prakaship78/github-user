//
//  GHLoadingView.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//

import SwiftUI

struct GHLoadingView: View {
    var isLoading : Bool
    var body: some View {
        ZStack {
            if isLoading {
                Color.black.opacity(0.4).ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(.automatic)
                    .scaleEffect(2.0)
            }
            
        }
    }
}

#Preview {
    GHLoadingView(isLoading: true)
}
