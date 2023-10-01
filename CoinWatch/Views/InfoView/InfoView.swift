//
//  MainTableView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct InfoView: View {
    
    @State private var posts: [Post] = Post.testArray
    
    private var networkService = NetworkService()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List(posts) { post in
                        NavigationLink {
                            InfoDetailsView(post: post)
                        } label: {
                            InfoRowView(post: post)
                        }
                    }
                    .task {
                        await requestTopCoins()
                    }
                }
            }
            .navigationTitle("Top Coins")
        }
    }
    
    private func requestTopCoins() async {
        networkService.requestTopCoins { result in
            
            switch result {
            case .success(let posts):
                self.posts = posts
            case .failure(let error):
                print(error)
            }
            
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
