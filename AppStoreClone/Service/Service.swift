//
//  Service.swift
//  AppStoreClone
//
//  Created by djepbarov on 16.04.2019.
//  Copyright © 2019 Davut. All rights reserved.
//

import UIKit

class Service {
    static let shared = Service()
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) ->()) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
            }
            
            do {
                guard let data = data else {return}
                let appGroup = try JSONDecoder().decode(T.self, from: data)
                completion(.success(appGroup))
            } catch {
                completion(.failure(error))
            }
            
            }.resume()
    }
    
    func fetchAppstoreApi<T: Decodable>(searchTerm: String, completion: @escaping (Result<T, Error>) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGames<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
       fetchGenericJSONData(urlString: "https://rss.itunes.apple.com/api/v1/tr/ios-apps/new-games-we-love/all/50/explicit.json", completion: completion)
    }
    
    func fetchTopFreeApps<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        fetchGenericJSONData(urlString: "https://rss.itunes.apple.com/api/v1/tm/ios-apps/top-free/all/50/explicit.json", completion: completion)
    }
    
    func fetchTopGrossing<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
       fetchGenericJSONData(urlString: "https://rss.itunes.apple.com/api/v1/tm/ios-apps/top-grossing/all/50/explicit.json", completion: completion)
    }
    
}
