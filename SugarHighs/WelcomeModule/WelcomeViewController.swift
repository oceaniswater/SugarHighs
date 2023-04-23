//
//  WelcomeViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 21/04/2023.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    var presenter: WelcomePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private properties
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "SugarHighs"
        label.font = UIFont.systemFont(ofSize: 30.0)
        return label
    }()
    
    let welcomePicImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "welcome-pic")
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Life is better with desserts. And we are do know where you can get it!"
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.tintColor = .white
        button.backgroundColor = K.Design.buttonNormalBackgroundColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func didTapGetStartedButton() {
        self.presenter.tapOnGetStarted()
    }
}

// MARK: - Setup View
private extension WelcomeViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        view.addSubview(appNameLabel)
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(welcomePicImage)
        welcomePicImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(350)
        }
        
        view.addSubview(getStartedButton)
        getStartedButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(52)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(getStartedButton.snp.bottom).inset(60)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.centerX.equalToSuperview()
        }
        
    }
}

// MARK: - WelcomeViewProtocol
extension WelcomeViewController: WelcomeViewProtocol {
    
}
