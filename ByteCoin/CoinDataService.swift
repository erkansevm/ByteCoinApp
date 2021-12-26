//
//  CoinDataService.swift
//  ByteCoin
//
//  Created by Erkan Sevim on 26.12.2021.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather()
}
class CoinDataService {
    var allCoins: [CoinModel] = []
    
    
    var delegate: WeatherManagerDelegate?
    
    func fetchCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=try&order=market_cap_desc&per_page=200&page=1&sparkline=false&price_change_percentage=24h")
        else { return }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                let coins = try! decoder.decode([CoinModel].self, from: data)
                self.allCoins = coins
                print("finished")
                self.delegate?.didUpdateWeather()
                
            }
        }
        task.resume()
    }
}
