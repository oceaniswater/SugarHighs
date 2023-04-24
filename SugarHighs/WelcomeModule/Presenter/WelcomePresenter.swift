//
//  WelcomePresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 23/04/2023.
//

import Foundation

protocol WelcomeViewProtocol: AnyObject {
}

protocol WelcomeViewPresenterProtocol: AnyObject {
    init(view: WelcomeViewProtocol, router: RouterProtocol)
    func tapOnGetStarted()
}

class WelcomePresenter: WelcomeViewPresenterProtocol {
    weak var view: WelcomeViewProtocol?
    var router: RouterProtocol?
    
    required init(view: WelcomeViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func tapOnGetStarted() {
        self.router?.signInViewController()
    }

}
