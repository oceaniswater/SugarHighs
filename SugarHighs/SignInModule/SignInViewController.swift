//
//  SignInViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 23/04/2023.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    var presenter: SignInPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    // MARK: - Private properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back to SugarHighs"
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "welcome-pic")
        return image
    }()
    
    let emailTitleView: UIView = {
        let view = UIView()
        let cornerRadius: CGFloat = 25.0
        view.layer.cornerRadius = cornerRadius
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .white
        return view
    }()
    
    let emailLoginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with email"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = .center
        return label
    }()
    
    let loginFormView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        // Create an SF Symbol configuration
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 14.0, weight: .light)
        
        // Create an SF Symbol image
        let symbolImage = UIImage(systemName: "envelope", withConfiguration: symbolConfig)
        
        // Create a UIImageView with the SF Symbol image
        let symbolImageView = UIImageView(image: symbolImage)
        
        // Set the content mode of the image view to scale aspect fit
        symbolImageView.contentMode = .scaleAspectFit
        
        // Set the size of the image view to match the height of the text field
        symbolImageView.frame = CGRect(x: 0, y: 0, width: textField.frame.height, height: textField.frame.height)
        
        // Set the image view as the left view of the text field
        textField.leftView = symbolImageView
        textField.leftViewMode = .always

        textField.tintColor = .black
        textField.backgroundColor = K.Design.appBackgroundColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .right
        // Create an SF Symbol configuration
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 14.0, weight: .light)
        
        // Create an SF Symbol image
        let symbolImage = UIImage(systemName: "lock", withConfiguration: symbolConfig)
        
        // Create a UIImageView with the SF Symbol image
        let symbolImageView = UIImageView(image: symbolImage)
        
        // Set the content mode of the image view to scale aspect fit
        symbolImageView.contentMode = .left
        
        // Set the size of the image view to match the height of the text field
        symbolImageView.frame = CGRect(x: 0, y: 0, width: textField.frame.height, height: textField.frame.height)
        
        // Set the image view as the left view of the text field
        textField.leftView = symbolImageView
        textField.leftViewMode = .always
        textField.tintColor = .black
        textField.backgroundColor = K.Design.appBackgroundColor
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        return textField
    }()
    
}

private extension SignInViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.height.width.equalTo(200)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(loginFormView)
        loginFormView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
            make.height.equalTo(400)
        }
        
        view.addSubview(emailTitleView)
        emailTitleView.snp.makeConstraints { make in
            make.bottom.equalTo(loginFormView.snp.bottom).inset(402)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        
        emailTitleView.addSubview(emailLoginTitleLabel)
        emailLoginTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        loginFormView.addSubview(loginTextField)
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(10)
        }
        
        loginFormView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalTo(loginTextField.snp.bottom).offset(5)
        }
        
        
    }
}

extension SignInViewController: SignInViewProtocol {
    
}
