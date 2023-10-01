//
//  NetworkService.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import Foundation

enum NetworkServiceError: Error {
    case badURL
    case connectionFailed
    case badResponse
    case statusCodeNot200
    case noDataReceived
    case failedToDecodeData
}

final class NetworkService {
    
    private let decoder = JSONDecoder()
    
    func requestTopCoins(_ completionHandler: @escaping (Result<[Post], NetworkServiceError>) -> Void) {
        
        let urlString = "https://api.coinstats.app/public/v1/coins?skip=0&limit=25&currency=USD/"

        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        let urlRequest = URLRequest(url: url)

        let urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            
            if let error  {
                print(error)
                completionHandler(.failure(.connectionFailed))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(.badResponse))
                return
            }
            
            guard response.statusCode == 200 else {
                completionHandler(.failure(.statusCodeNot200))
                return
            }
            
            guard let data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
    
            guard let decodedCoinsData = try? self?.decoder.decode(Coins.self, from: data) else  {
                completionHandler(.failure(.failedToDecodeData))
                return
            }
            
            let posts = decodedCoinsData.coins
            completionHandler(.success(posts))
        
        }
        
        dataTask.resume()
        
    }
    
    func requestCoinImage(from url: URL, _ completionHandler: @escaping (Result<[Post], NetworkServiceError>) -> Void) {
        
        
        
    }
}



