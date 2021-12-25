//
//  CoinCollectionViewCell.swift
//  ByteCoin
//
//  Created by Erkan Sevim on 25.12.2021.
//

import UIKit
 let greenColor = UIColor(red: 8/255, green: 215/255, blue: 160/255, alpha: 1)
 let redColor = UIColor(red: 214/255, green: 41/255, blue: 41/255, alpha: 1)

class CoinCollectionViewCell: UICollectionViewCell {
    static let cellId = "CoinCellId"
    
    
    let containerView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.clipsToBounds = true
        myView.backgroundColor = .white
        return myView
    }()
    
    
    let coinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "bitcoin")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let coinNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Bitcoin"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "BTC/TRY"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$407,89"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let differanceLabel: UILabel = {
        let label = UILabel()
        label.text = "+2.67%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = greenColor
        return label
    }()
    
    let indicatorView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.up.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = greenColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        containerView.addSubview(coinImage)
        containerView.addSubview(coinNameLabel)
        containerView.addSubview(typeLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(indicatorView)
        containerView.addSubview(differanceLabel)
        
        configureContainerView()
        configureCoinImage()
        configureCoinName()
        configureTypeLabel()
        configurePriceLabel()
        configureIndicatorView()
        configureDifferenceLabel()
    }
    
    
    
    func configureContainerView() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
        ])
        containerView.layer.cornerRadius = 10
    }
    
    func configureCoinImage() {
        NSLayoutConstraint.activate([
            coinImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18),
            coinImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -18),
            coinImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
        ])
        coinImage.widthAnchor.constraint(equalTo: coinImage.heightAnchor, multiplier: 1).isActive = true
        self.layoutIfNeeded()
        coinImage.layer.cornerRadius = coinImage.frame.height / 2

        coinImage.backgroundColor = .yellow
    }
    
    func configureCoinName() {
        NSLayoutConstraint.activate([
            coinNameLabel.leadingAnchor.constraint(equalTo: coinImage.trailingAnchor, constant: 10),
            coinNameLabel.topAnchor.constraint(equalTo: coinImage.topAnchor, constant: 8)
        ])
    }
    
    func configureTypeLabel()  {
        NSLayoutConstraint.activate([
            typeLabel.bottomAnchor.constraint(equalTo: coinImage.bottomAnchor,constant: -8),
            typeLabel.leadingAnchor.constraint(equalTo: coinNameLabel.leadingAnchor),
        ])
    }
    
    func configurePriceLabel()  {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: coinNameLabel.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
    }
    
    func configureIndicatorView() {
        NSLayoutConstraint.activate([
            indicatorView.bottomAnchor.constraint(equalTo: typeLabel.bottomAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
        ])
    }
    
    func configureDifferenceLabel() {
        NSLayoutConstraint.activate([
            differanceLabel.trailingAnchor.constraint(equalTo: indicatorView.leadingAnchor),
            differanceLabel.bottomAnchor.constraint(equalTo: typeLabel.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
