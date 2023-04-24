//
//  HomePresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
}

protocol HomeViewPresenterProtocol: AnyObject {
    init(view: HomeViewProtocol, router: RouterProtocol)
}

class HomePresenter: HomeViewPresenterProtocol {
    weak var view: HomeViewProtocol?
    var router: RouterProtocol?
    
    required init(view: HomeViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

}
