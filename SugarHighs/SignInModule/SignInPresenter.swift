//
//  SignInPresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 23/04/2023.
//

import Foundation

protocol SignInViewProtocol: AnyObject {
}

protocol SignInViewPresenterProtocol: AnyObject {
    init(view: SignInViewProtocol, router: RouterProtocol)

}

class SignInPresenter: SignInViewPresenterProtocol {
    weak var view: SignInViewProtocol?
    var router: RouterProtocol?
    
    required init(view: SignInViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    

}
