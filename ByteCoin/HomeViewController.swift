//
//  ViewController.swift
//  ByteCoin
//
//  Created by Erkan Sevim on 23.12.2021.
//

import UIKit





private let headerId = "headerID"
private let footerId = "footerId"


class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout,WeatherManagerDelegate {
   
    
    
  
    let currency = "try"
    
    var coinDataService =  CoinDataService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinDataService.delegate = self
        coinDataService.fetchCoins()
        collectionView.backgroundColor = .white
        
        collectionView.register(CoinCollectionViewCell.self, forCellWithReuseIdentifier: CoinCollectionViewCell.cellId)
        
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        
    }
    
    
   
    
    
    func didUpdateWeather() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinDataService.allCoins.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoinCollectionViewCell.cellId, for: indexPath) as! CoinCollectionViewCell
        
        let coin = coinDataService.allCoins[indexPath.row]
        cell.coinNameLabel.text = coin.name
        cell.typeLabel.text = "\(coin.symbol.uppercased())/\(currency.uppercased())"
        cell.priceLabel.text = "\(coin.currentPrice.asCurrencyWith6Decimals())"
        if coin.priceChangePercentage24HInCurrency! < 0 {
            cell.indicatorView.tintColor = Constants.redColor
            cell.differanceLabel.textColor = Constants.redColor
        }
        cell.differanceLabel.text = "\(coin.priceChangePercentage24HInCurrency?.asNumberString() ?? "0.00")"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            header.backgroundColor = .systemBlue
            return header
        }
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
        footer.backgroundColor = .green
        
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }

}






