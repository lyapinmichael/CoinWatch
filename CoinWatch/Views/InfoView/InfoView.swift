//
//  MainTableView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct InfoView: View {
    
   @State private var posts: [Post]
    
    private var isTitleOn: Bool
    private var networkService: NetworkService
    
    //
    // Custom public init is needed to avoid error occured because some
    // of the properties have default value, so compiler complains that
    // init is inaccessable due to private restriction.
    //
    init(posts: [Post] = Post.testArray, networkService: NetworkService = NetworkService(), isTitleOn: Bool = true) {
        self.posts = posts
        self.networkService = networkService
        self.isTitleOn = isTitleOn
    }
    
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
                }
            }
            .navigationTitle("Top Coins")
            .toolbar(isTitleOn ? .visible : .hidden, for: .navigationBar)
        }
        .onAppear {
            Task {
                await requestTopCoins()
            }
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
