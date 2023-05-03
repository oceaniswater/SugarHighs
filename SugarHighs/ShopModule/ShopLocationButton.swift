//
//  ShopLocationButton.swift
//  SugarHighs
//
//  Created by Mark Golubev on 03/05/2023.
//
import UIKit
import SnapKit

class ShopLocationButton: UIButton {
    
    // MARK: - Properties
    
    private let defaultFontSize: CGFloat = 16
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Properties
    
    
    private let locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "mappin.circle.fill")
        image.tintColor = K.Design.buttonNormalBackgroundColor
        return image
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "See location on map"
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = .black
        return label
    }()
    
    
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        return image
    }()
    
}

// MARK: - Setup View
private extension ShopLocationButton {
    func setupButton() {
        backgroundColor = .white
        layer.cornerRadius = 25
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension ShopLocationButton {
    func addSubview() {
        addSubview(locationImage)
        addSubview(textLabel)
        addSubview(arrowImage)
    }
}

// MARK: - Setup Layout
private extension ShopLocationButton {
    func setupLayout() {
        snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        locationImage.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.leading.top.bottom.equalToSuperview().inset(5)
        }
        
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationImage.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
}
