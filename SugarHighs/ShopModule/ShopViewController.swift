//
//  ShopViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 27/04/2023.
//

import UIKit
import SnapKit

class ShopViewController: UIViewController {
    
    var presenter: ShopViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.setShop()
        setupView()
        
        
        //        self.navigationItem.leftBarButtonItem = nil
        //        self.navigationItem.hidesBackButton = true
    }
    
    
    // MARK: - Private properties
    
    private let shopImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "candyshop")
        image.layer.cornerRadius = 10
        return image
    }()
    
    private let locationButton: ShopLocationButton = {
        let button = ShopLocationButton()
        return button
    }()
    
    private let shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop Name"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    private let shopLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop Location"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    private let rewardsButton: SeeRewardsButton = {
        let button = SeeRewardsButton()
        return button
    }()
}

// MARK: - Setup View
private extension ShopViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        shopImage.layer.cornerRadius = 15
        shopImage.clipsToBounds = true
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension ShopViewController {
    func addSubview() {
        view.addSubview(shopImage)
        shopImage.addSubview(locationButton)
        view.addSubview(shopNameLabel)
        view.addSubview(shopLocationLabel)
        view.addSubview(rewardsButton)
    }
}

// MARK: - Setup Layout
private extension ShopViewController {
    func setupLayout() {
        shopImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(300)
        }
        
        locationButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.leading.equalToSuperview().inset(20)
        }
        
        shopNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(shopImage.snp.bottom).offset(30)
        }
        
        shopLocationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(shopNameLabel.snp.bottom).offset(10)
        }
        
        rewardsButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(shopLocationLabel.snp.bottom).offset(10)
        }
    }
}

extension ShopViewController: ShopViewProtocol {
    func setShop(shop: Shop) {
        shopNameLabel.text = shop.name
        shopLocationLabel.text = shop.location
    }
    
    func success() {
        //
    }
    
    
}
