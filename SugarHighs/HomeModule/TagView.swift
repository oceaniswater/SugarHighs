//
//  TagView.swift
//  SugarHighs
//
//  Created by Mark Golubev on 26/04/2023.
//

import UIKit
import SnapKit

class TagView: UIView {

    // MARK: - Private properties
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    
    func configure(with tags: Tags) {
        switch tags {
        case .icecream:
            label.text = tags.rawValue
            backgroundColor = K.Design.icecreamTagColor
            label.textColor = K.Design.icecreamTextTagColor
        case .donuts:
            label.text = tags.rawValue
            backgroundColor = K.Design.donutTagColor
            label.textColor = K.Design.donutTextTagColor
        case .pies:
            label.text = tags.rawValue
            backgroundColor = K.Design.piesTagColor
            label.textColor = K.Design.piesTextTagColor
        case .sweets:
            label.text = tags.rawValue
            backgroundColor = K.Design.sweetsTagColor
            label.textColor = K.Design.sweetsTextTagColor
        case .fruits:
            label.text = tags.rawValue
            backgroundColor = K.Design.fruitsTagColor
            label.textColor = K.Design.fruitsTextTagColor
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupView()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .clear

        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(5)
        }
    }
    
}
