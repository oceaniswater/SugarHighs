//
//  ItemTableViewCell.swift
//  SugarHighs
//
//  Created by Mark Golubev on 25/04/2023.
//

import UIKit
import SnapKit

class ItemTableViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "ItemTableViewCell"
        }
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let itemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.tintColor = .black
        return label
    }()
    
    private let locationSymbol: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "mappin.circle.fill"))
        image.tintColor = K.Design.buttonNormalBackgroundColor
        return image
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.tintColor = .black
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.tintColor = .black
        return label
    }()
    
    private var hStack: UIStackView!
    private var tagsStack: UIStackView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImage.image = nil
        titleLabel.text = nil
        locationLabel.text = nil
        priceLabel.text = nil
        tagsStack = UIStackView()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemImage.layer.cornerRadius = 15
        itemImage.clipsToBounds = true
    }
    

    
    // MARK: - Public methods
    func configure(with item: Item) {
        itemImage.image = UIImage(named: item.image)
        titleLabel.text = item.name.capitalizedSentence
        locationLabel.text = "\(item.shop.location)"
        priceLabel.text = "£ \(item.price)"
        
        for tag in item.tags {
            let view = TagView()
            view.configure(with: tag)
            tagsStack.addArrangedSubview(view)
        }
    }
}

// MARK: - Setup Cell
private extension ItemTableViewCell {
    func setupCell() {
        backgroundColor = .clear
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension ItemTableViewCell {
    func addSubview() {
        addSubview(view)
        view.addSubview(itemImage)
        view.addSubview(titleLabel)
        
        hStack = UIStackView(arrangedSubviews: [locationSymbol, locationLabel])
        hStack.axis = .horizontal
        hStack.spacing = 2
        hStack.alignment = .leading
        
        view.addSubview(hStack)
        view.addSubview(priceLabel)
        
        tagsStack = UIStackView(arrangedSubviews: [])
        tagsStack.axis = .horizontal
        tagsStack.spacing = 3
//        tagsStack.alignment = .center
        tagsStack.distribution = .equalSpacing
        
        view.addSubview(tagsStack)
        
    }
}

// MARK: - Setup Layout
private extension ItemTableViewCell {
    func setupLayout() {
        view.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(8)
            make.height.equalTo(120)
        }
        
        itemImage.snp.makeConstraints { make in
            make.height.width.equalTo(90)
            make.top.bottom.leading.equalToSuperview().inset(15)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(itemImage.snp.top)
            make.leading.equalTo(itemImage.snp.trailing).offset(10)
        }
        
        tagsStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(itemImage.snp.trailing).offset(10)
        }
        
        
        hStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(15)
            make.leading.equalTo(itemImage.snp.trailing).offset(10)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(15)
        }
        
    }
}
