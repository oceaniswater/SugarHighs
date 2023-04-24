//
//  CartViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

class CartViewController: UIViewController {
    
    var presenter: CartViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


}

// MARK: - Setup View
private extension CartViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension CartViewController {
    func addSubview() {
        
    }
}

// MARK: - Setup Layout
private extension CartViewController {
    func setupLayout() {
        
    }
}

extension CartViewController: CartViewProtocol {
    
}
