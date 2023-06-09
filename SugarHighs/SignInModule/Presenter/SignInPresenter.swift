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
    func tapOnSignIn(login: String, password: String)
    func tapOnForgotPassword()
    func tapOnAppleSignIn()
    func tapOnFacebookSignIn()
    func tapOnSignUp()

}

class SignInPresenter: SignInViewPresenterProtocol {
    
    weak var view: SignInViewProtocol?
    var router: RouterProtocol?
    
    required init(view: SignInViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func tapOnSignIn(login: String, password: String) {
        router?.tabBarController()
    }
    
    func tapOnForgotPassword() {
        print(#function)
    }
    
    func tapOnAppleSignIn() {
        print(#function)
    }
    
    func tapOnFacebookSignIn() {
        print(#function)
    }
    
    func tapOnSignUp() {
        print(#function)
    }

}
