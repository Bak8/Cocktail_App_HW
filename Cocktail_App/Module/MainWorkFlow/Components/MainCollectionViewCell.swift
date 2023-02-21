//
//  MenuCollectionViewCell.swift
//  Cocktail_App
//
//  Created by Atai Begaliev on 21/2/23.
//

import Foundation

import UIKit
import SnapKit
import Kingfisher

class MenuCollectionViewCell: UICollectionViewCell {
    
    var coctail: Drinks?
    
    static var reuseIdentifier = String(describing: MenuCollectionViewCell.self)
    
    var productImage: UIImageView! = {
        var productImage = UIImageView()
        productImage.contentMode = .scaleAspectFit
        productImage.layer.cornerRadius = 40
        productImage.clipsToBounds = true
        return productImage
    }()
    
    var productLabel: UILabel = {
        var productLabel = UILabel()
        productLabel.text = "Fried Rice"
        productLabel.numberOfLines = 0
        productLabel.textAlignment = .center
        productLabel.font = UIFont(name: "Avenir", size: 17)
        return productLabel
    }()
    
    var productBuyButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(cgColor: CGColor(
                                             red: 250/265,
                                           green: 120/265,
                                            blue: 91/265,
                                           alpha: 1))
        button.setTitle("Buy now", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .semibold)
        button.layer.cornerRadius = 5
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5)
        button.layer.shadowOpacity = 0.2
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .tabBarColor
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubviews() {
        self.addSubview(productImage)
        self.addSubview(productLabel)
        self.addSubview(productBuyButton)
    }
    
    private func setUpConstraints() {
        productImage.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(10)
            maker.width.height.equalTo(140)
        }
        
        productLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(productImage.snp.bottom).offset(5)
            maker.centerX.equalTo(productImage)
            maker.width.equalTo(120)
            maker.height.equalTo(50)
        }
        
        productBuyButton.snp.makeConstraints { maker in
            maker.top.equalTo(productLabel.snp.bottom).offset(5)
            maker.centerX.equalTo(productLabel)
            maker.width.equalTo(100)
            maker.height.equalTo(30)
        }
    }
    
    private func setUpUI() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func displayInfo(product: Drinks) {
        coctail = product
        productLabel.text = product.strDrink
        productImage.kf.setImage(with: URL(string: product.strDrinkThumb ?? ""))
    }
}
