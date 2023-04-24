//
//  CartPresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import Foundation

protocol CartViewProtocol: AnyObject {
}

protocol CartViewPresenterProtocol: AnyObject {
    init(view: CartViewProtocol, router: RouterProtocol)
}

class CartPresenter: CartViewPresenterProtocol {
    weak var view: CartViewProtocol?
    var router: RouterProtocol?
    
    required init(view: CartViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

}
