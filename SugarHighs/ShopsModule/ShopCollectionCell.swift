//
//  ShopCollectionCell.swift
//  SugarHighs
//
//  Created by Mark Golubev on 27/04/2023.
//

import UIKit
import SnapKit

class ShopCollectionCell: UICollectionViewCell {
    
    public static var identifier: String {
        get {
            return "ShopCollectionCell"
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let shopImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
    }()
    
    private let destinationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        return image
    }()
    
    
    private var descriptionVStack: UIStackView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        shopImageView.image = nil
        nameLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shopImageView.layer.cornerRadius = 15
        shopImageView.clipsToBounds = true
        layer.cornerRadius = 15
    }
    
    // MARK: - Public methods
    func configure(with shop: Shop) {
        shopImageView.image = UIImage(named: shop.image)
        nameLabel.text = shop.name
        locationLabel.text = shop.location
        destinationLabel.text = "\(Float(Int.random(in: 1...10)) / 2) km"
    }
}


// MARK: - Setup View
private extension ShopCollectionCell {
    func setupCell() {
        backgroundColor = .white
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension ShopCollectionCell {
    func addSubview() {
        
        addSubview(shopImageView)
        
        descriptionVStack = UIStackView(arrangedSubviews: [nameLabel, locationLabel])
        descriptionVStack.axis = .vertical
        descriptionVStack.spacing = 2
        descriptionVStack.alignment = .leading
        descriptionVStack.distribution = .fillProportionally
        contentView.addSubview(descriptionVStack)
        
        addSubview(destinationLabel)
        addSubview(arrowImage)
        
    }
}

// MARK: - Setup Layout
private extension ShopCollectionCell {
    func setupLayout() {
        shopImageView.snp.makeConstraints { make in
            make.height.width.equalTo(130)
            make.top.leading.trailing.equalToSuperview().inset(15)
        }
        
        descriptionVStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalTo(shopImageView.snp.bottom).offset(5)

        }
        
        destinationLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview().inset(15)
//            make.top.equalTo(descriptionVStack.snp.bottom).offset(5)

        }
        
        arrowImage.snp.makeConstraints { make in
            make.height.width.equalTo(20)
//            make.top.equalTo(descriptionVStack.snp.bottom).offset(15)
            make.bottom.trailing.equalToSuperview().inset(15)
            
            
        }
    }
}

