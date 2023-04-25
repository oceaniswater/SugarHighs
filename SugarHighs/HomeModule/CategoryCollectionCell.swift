//
//  CategoryCollectionCell.swift
//  SugarHighs
//
//  Created by Mark Golubev on 25/04/2023.
//

import UIKit
import SnapKit

class CategoryCollectionCell: UICollectionViewCell {
    
    public static var identifier: String {
        get {
            return "CategoryCollectionCell"
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
    private let categoryImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    private var vStack: UIStackView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryImageView.image = nil
        descriptionLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryImageView.layer.cornerRadius = 15
        categoryImageView.clipsToBounds = true
    }
    
    // MARK: - Public methods
    func configure(with category: Category) {
        categoryImageView.image = UIImage(named: category.image)
        descriptionLabel.text = category.description
    }
}

// MARK: - Private methods
//private extension CategoryCollectionCell {
//    func setupCell() {
//        contentView.addSubview(categoryImageView)
//        categoryImageView.snp.makeConstraints { maker in
//            maker.edges.equalToSuperview()
//        }
//        contentView.backgroundColor = .clear
//    }
//}

// MARK: - Setup View
private extension CategoryCollectionCell {
    func setupCell() {
        backgroundColor = .clear
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension CategoryCollectionCell {
    func addSubview() {
        
        vStack = UIStackView(arrangedSubviews: [categoryImageView, descriptionLabel])
        vStack.axis = .vertical
        vStack.spacing = 0
        vStack.alignment = .leading
        vStack.distribution = .fillProportionally
        contentView.addSubview(vStack)
        
    }
}

// MARK: - Setup Layout
private extension CategoryCollectionCell {
    func setupLayout() {
        categoryImageView.snp.makeConstraints { make in
            make.height.width.equalTo(140)
        }
        
        vStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.height.width.equalTo(120)
        }
    }
}
