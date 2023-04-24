//
//  SignInViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 23/04/2023.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    // MARK: - Presenter
    var presenter: SignInPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTextField()
        
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
    
    let loginTextField: AuthTextField = {
        let textField = AuthTextField(symbol: "envelope", placeholder: "email")
        textField.tag = 0
        return textField
    }()
    
    let passwordTextField: AuthTextField = {
        let textField = AuthTextField(symbol: "lock", placeholder: "password")
        textField.tag = 1
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .clear
        
        let attributedString = NSAttributedString(string: "Forgot password?", attributes:
                                                    [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.tintColor = .white
        button.backgroundColor = K.Design.buttonNormalBackgroundColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        return button
    }()
    
    let alternativeSignInLabel: UILabel = {
        let label = UILabel()
        label.text = "Or Sign in with"
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var appleSignInButton: UIButton = {
        let button = UIButton()
        let appleLogoImage = UIImage(systemName: "applelogo")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(appleLogoImage, for: .normal)
        button.setTitle(" Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = K.Design.appBackgroundColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(didTapAppleSignInButton), for: .touchUpInside)
        return button
    }()
    
    lazy var facebookSignInButton: UIButton = {
        let button = UIButton()
        let facebookLogoImage = UIImage(systemName: "f.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(facebookLogoImage, for: .normal)
        button.setTitle(" Facebook", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = K.Design.appBackgroundColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(didTapFacebookSignInButton), for: .touchUpInside)
        return button
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.backgroundColor = .clear
        
        let attributedString = NSAttributedString(string: "Sign up", attributes:
                                                    [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        
        button.setAttributedTitle(attributedString, for: .normal)
                button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    var alternativeSigninHStack: UIStackView!
    var signUpHStack: UIStackView!
    
    
    // MARK: - Buttons actions
    @objc func didTapForgotPasswordButton() {
        self.presenter.tapOnForgotPassword()
    }
    
    @objc func didTapSignInButton() {
        self.closeKeyboard()
        self.presenter.tapOnSignIn(login: loginTextField.text!, password: passwordTextField.text!)
    }
    
    @objc func didTapAppleSignInButton() {
        self.presenter.tapOnAppleSignIn()
    }
    
    @objc func didTapFacebookSignInButton() {
        self.presenter.tapOnFacebookSignIn()
    }
    
    @objc func didTapSignUpButton() {
        self.presenter.tapOnSignUp()
    }

    
}

// MARK: - Setup View
private extension SignInViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
extension SignInViewController {
    func addSubview() {
        view.addSubview(titleLabel)
        view.addSubview(image)
        view.addSubview(loginFormView)
        view.addSubview(emailTitleView)
        emailTitleView.addSubview(emailLoginTitleLabel)
        loginFormView.addSubview(loginTextField)
        loginFormView.addSubview(passwordTextField)
        loginFormView.addSubview(forgotPasswordButton)
        loginFormView.addSubview(signInButton)
        loginFormView.addSubview(alternativeSignInLabel)
        
        
        alternativeSigninHStack = UIStackView(arrangedSubviews: [appleSignInButton, facebookSignInButton])
        alternativeSigninHStack.axis = .horizontal
        alternativeSigninHStack.spacing = 5
        alternativeSigninHStack.alignment = .center
        alternativeSigninHStack.distribution = .fillEqually
        
        loginFormView.addSubview(alternativeSigninHStack)
        
        signUpHStack = UIStackView(arrangedSubviews: [signUpLabel, signUpButton])
        signUpHStack.axis = .horizontal
        signUpHStack.spacing = 0
        signUpHStack.alignment = .center
        signUpHStack.distribution = .fillEqually
        
        loginFormView.addSubview(signUpHStack)

        
    }
}

// MARK: - Setup Layout
private extension SignInViewController {
    func setupLayout() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(200)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        loginFormView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
            make.height.equalTo(400)
        }
        
        emailTitleView.snp.makeConstraints { make in
            make.bottom.equalTo(loginFormView.snp.bottom).inset(402)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        
        emailLoginTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(10)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalTo(loginTextField.snp.bottom).offset(5)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(15)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(52)
        }
        
        alternativeSignInLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(20)
        }
        
        appleSignInButton.snp.makeConstraints { make in
            make.height.equalTo(52)

        }
        
        facebookSignInButton.snp.makeConstraints { make in
            make.height.equalTo(52)

        }
        
        alternativeSigninHStack.snp.makeConstraints { make in
            make.top.equalTo(alternativeSignInLabel.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(15)

        }
        
        signUpHStack.snp.makeConstraints { make in
            make.top.equalTo(alternativeSigninHStack.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        
        
        
    }
}

// MARK: - SignInViewProtocol
extension SignInViewController: SignInViewProtocol {
    
}
