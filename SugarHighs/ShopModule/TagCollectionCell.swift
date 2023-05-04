//
//  TagCollectionCell.swift
//  SugarHighs
//
//  Created by Mark Golubev on 04/05/2023.
//

import UIKit
import SnapKit

class TagCollectionCell: UICollectionViewCell {
    
    public static var identifier: String {
        get {
            return "TagCollectionCell"
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
    lazy var tagButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.addTarget(self, action: #selector(didTapTagButton), for: .touchDown)
        return button
    }()
    
    
    // MARK: - Private methods
    @objc private func didTapTagButton() {
        DispatchQueue.main.async {
            if self.tagButton.backgroundColor == .white {
                self.tagButton.backgroundColor = K.Design.buttonNormalBackgroundColor
//                self.tagButton.setTitleColor(.white, for: .selected)
            } else {
                self.tagButton.backgroundColor = .white
//                self.tagButton.setTitleColor(.black, for: .normal)
            }
        }
    }
    

    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tagButton.layer.cornerRadius = 16
        tagButton.clipsToBounds = true
    }
    
    // MARK: - Public methods
    func configure(with tag: Tags) {
        tagButton.setTitle(tag.rawValue.capitalizedSentence, for: .normal)
    }
}


// MARK: - Setup View
private extension TagCollectionCell {
    func setupCell() {
        backgroundColor = .clear
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension TagCollectionCell {
    func addSubview() {
        addSubview(tagButton)

        
    }
}

// MARK: - Setup Layout
private extension TagCollectionCell {
    func setupLayout() {
        
        tagButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
}
