//
//  InfoRow.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct InfoRowView: View {
    let post: Post
    
    var body: some View {
        HStack(alignment: .center) {
            
            if let imageName = post.imageName {
                Image(imageName)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            } else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            
            Text(post.abbreviation)
                .font(.system(size: 24))
                .fontWeight(.semibold)
            
            Text(post.title)
                .font(.system(size: 22))
                .fontWeight(.regular)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(post: Post.etherium)
    }
}
