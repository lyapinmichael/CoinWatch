//
//  Post.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import Foundation


struct Post: Identifiable {
  
    var id = UUID()
    
    let title: String
    let abbreviation: String
    let imageName: String?
    let imageLink: String?
    let rank: Int
    let priceUSD: Double
    let priceChange1h: Double
    let priceChange1d: Double
    let priceChange1w: Double
    let priceBTC: Double
    let marketCap: Double
    let avaliableSupply: Int
  
    
}

extension Post {
    static var bitcoin = Post(title: "Bitcoin",
                              abbreviation: "BTC",
                              imageName: "Bitcoin",
                              imageLink: nil,
                              rank: 1,
                              priceUSD: 27182.60,
                              priceChange1h: -0.03,
                              priceChange1d: 0.84,
                              priceChange1w: 2.15,
                              priceBTC: 1,
                              marketCap: 530087907110.77,
                              avaliableSupply: 19501000)
    
    static var etherium = Post(title: "Etherium",
                               abbreviation: "ETH",
                               imageName: "Etherium",
                               imageLink: nil,
                               rank: 2,
                               priceUSD:  1685.56,
                               priceChange1h: -0.16,
                               priceChange1d: 0.45,
                               priceChange1w: 5.6,
                               priceBTC: 0.062008935,
                               marketCap: 202669516514.04,
                               avaliableSupply: 120238637)
    
    static var tether = Post(title: "Tether",
                             abbreviation: "USDT",
                             imageName: "Tether",
                             imageLink: nil,
                             rank: 3,
                             priceUSD: 1.001968,
                             priceChange1h: -0.03,
                             priceChange1d: -0.08,
                             priceChange1w: 0.08,
                             priceBTC: 0.00003686,
                             marketCap: 83418934122.04,
                             avaliableSupply: 83255047972)
    
    static var testArray: [Post] = [bitcoin, etherium, tether]
}
