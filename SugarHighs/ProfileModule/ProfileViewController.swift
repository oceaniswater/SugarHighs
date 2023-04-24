//
//  ProfileViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

import UIKit

class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


}

// MARK: - Setup View
private extension ProfileViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension ProfileViewController {
    func addSubview() {
        
    }
}

// MARK: - Setup Layout
private extension ProfileViewController {
    func setupLayout() {
        
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
}
