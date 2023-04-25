//
//  PopularButton.swift
//  SugarHighs
//
//  Created by Mark Golubev on 25/04/2023.
//

import UIKit
import SnapKit

class PopularButton: UIButton {
    
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
    private let redView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = K.Design.buttonNormalBackgroundColor
        return view
    }()
    
    private let heartImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = .white
        return image
    }()
    
    private let popularLabel: UILabel = {
       let label = UILabel()
        label.text = "Popular"
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = .black
        return label
    }()
    
    private let popularAditionalLabel: UILabel = {
       let label = UILabel()
        label.text = "Let's choose, and enjoy!"
        label.font = UIFont.systemFont(ofSize: 12)
        label.tintColor = .black
        return label
    }()
    
    private var vStack: UIStackView!
    
    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        return image
    }()
    
}

// MARK: - Setup View
private extension PopularButton {
    func setupButton() {
        backgroundColor = K.Design.appBackgroundColor
        layer.cornerRadius = 10
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension PopularButton {
    func addSubview() {
        addSubview(redView)
        redView.addSubview(heartImage)
        
        vStack = UIStackView(arrangedSubviews: [popularLabel, popularAditionalLabel])
        vStack.axis = .vertical
        vStack.spacing = 1
        vStack.alignment = .leading
//        vStack.distribution = .fillEqually
        
        addSubview(vStack)
        addSubview(arrowImage)
    }
}

// MARK: - Setup Layout
private extension PopularButton {
    func setupLayout() {
        redView.snp.makeConstraints { make in
            make.height.width.equalTo(52)
            make.leading.top.bottom.equalToSuperview()
        }
        
        heartImage.snp.makeConstraints { make in
            make.center.equalTo(redView)
            make.height.width.equalTo(30)
        }
        
        vStack.snp.makeConstraints { make in
            make.leading.equalTo(redView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.height.equalTo(44)
        }
        
        arrowImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
    }
}
