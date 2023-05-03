//
//  SeeRewardsButton.swift
//  SugarHighs
//
//  Created by Mark Golubev on 03/05/2023.
//

import Foundation

import UIKit
import SnapKit

class SeeRewardsButton: UIButton {
    
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
    
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Check the reward in this place"
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "16 rewards"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = K.Design.buttonNormalBackgroundColor
        return label
    }()
    
    
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        return image
    }()
    
    private var vStack: UIStackView!
    
}

// MARK: - Setup View
private extension SeeRewardsButton {
    func setupButton() {
        backgroundColor = .white
        layer.cornerRadius = 15
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension SeeRewardsButton {
    func addSubview() {
        addSubview(mainTitleLabel)
        
        vStack = UIStackView(arrangedSubviews: [mainTitleLabel, descriptionLabel])
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.alignment = .leading
        
        addSubview(vStack)
        addSubview(arrowImage)
    }
}

// MARK: - Setup Layout
private extension SeeRewardsButton {
    func setupLayout() {
        snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        vStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
    }
}
