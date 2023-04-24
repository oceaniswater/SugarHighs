//
//  ProfilePresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import Foundation

protocol ProfileViewProtocol: AnyObject {
}

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol, router: RouterProtocol)
}

class ProfilePresenter: ProfileViewPresenterProtocol {
    weak var view: ProfileViewProtocol?
    var router: RouterProtocol?
    
    required init(view: ProfileViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

}
