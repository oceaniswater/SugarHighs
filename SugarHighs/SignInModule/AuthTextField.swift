//
//  AuthTextField.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

final class AuthTextField: UITextField {
    
    // MARK: - Private Properties
    private let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 20)
    private let leftViewpadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    // MARK: - Initializers
    init(symbol: String, placeholder: String) {
        super.init(frame: .zero)
        setupTextField(symbol: symbol, placeholder: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: leftViewpadding)
    }
    
    // MARK: - Private Methods
    private func setupTextField(symbol: String, placeholder: String) {
        textColor = .black
        
        layer.cornerRadius = 10
        backgroundColor = K.Design.appBackgroundColor
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        font = .systemFont(ofSize: 15)
        
        // Create an SF Symbol configuration
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 14.0, weight: .light)
        
        // Create an SF Symbol image
        let symbolImage = UIImage(systemName: symbol, withConfiguration: symbolConfig)
        
        // Create a UIImageView with the SF Symbol image
        let symbolImageView = UIImageView(image: symbolImage)
        
        // Set the content mode of the image view to scale aspect fit
        symbolImageView.contentMode = .left
        
        // Set the size of the image view to match the height of the text field
        symbolImageView.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
        
        // Set the image view as the left view of the text field
        leftView = symbolImageView
        leftViewMode = .always
        tintColor = .black
        
    }
    
}
