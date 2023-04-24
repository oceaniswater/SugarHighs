//
//  ShopsViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

class ShopsViewController: UIViewController {
    
    var presenter: ShopsViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


}

// MARK: - Setup View
private extension ShopsViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension ShopsViewController {
    func addSubview() {
        
    }
}

// MARK: - Setup Layout
private extension ShopsViewController {
    func setupLayout() {
        
    }
}

// MARK: - ShopsViewProtocol
extension ShopsViewController: ShopsViewProtocol {
    
}
