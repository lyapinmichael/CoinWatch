//
//  MainTableView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List(Post.testArray) { post in
                        NavigationLink {
                            InfoDetailsView(post: post)
                        } label: {
                            InfoRowView(post: post)
                        }
                    }
                }
            }
            .navigationTitle("Top Coins")
          
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
