//
//  HomeViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Presenter
    var presenter: HomeViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

}

// MARK: - Setup View
private extension HomeViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension HomeViewController {
    func addSubview() {
        
    }
}

// MARK: - Setup Layout
private extension HomeViewController {
    func setupLayout() {
        
    }
}

extension HomeViewController: HomeViewProtocol {
    
}
