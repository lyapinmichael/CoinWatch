//
//  InfoDetailsView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct InfoDetailsView: View {
    let post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                InfoRowView(post: post)
                Text("Rank".localized + ":\t" + "\(post.rank)")
                Text("Price".localized + ":\t$" + "\(post.priceUSD)")
                Text("PriceChange1h" + ":\t" + "\(post.priceChange1h)")
                Text("PriceChange1d" + ":\t" + "\(post.priceChange1d)")
                Text("PriceChange1w" + ":\t" + "\(post.priceChange1w)")
                Text("PriceBTC".localized + ":\tBTC " + "\(post.priceBTC)")
                Text("MarketCap".localized + ":\t$" + "\(post.marketCap)")
                Text("AvaliableSupply".localized + ":\t$" + "\(post.avaliableSupply)")
                
                    
            }
            .padding(.leading, 16)
        }
    }
}

struct InfoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetailsView(post: Post.bitcoin)
    }
}
