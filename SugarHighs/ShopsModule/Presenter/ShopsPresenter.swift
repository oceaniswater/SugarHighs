//
//  ShopsPresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import Foundation

protocol ShopsViewProtocol: AnyObject {
}

protocol ShopsViewPresenterProtocol: AnyObject {
    init(view: ShopsViewProtocol, router: RouterProtocol)
}

class ShopsPresenter: ShopsViewPresenterProtocol {
    weak var view: ShopsViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ShopsViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

}
