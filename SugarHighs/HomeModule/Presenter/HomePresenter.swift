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
    
    func numberOfSection() -> Int
    func numberOfItemsInSection(in section: Int) -> Int
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    
    var view: HomeViewProtocol? {get set}
    var router: RouterProtocol? {get set}
    var categories: [Category]? {get set}
    var items: [Item]? {get set}
}

class HomePresenter: HomeViewPresenterProtocol {

    
    weak var view: HomeViewProtocol?
    var router: RouterProtocol?
    var categories: [Category]?
    var items: [Item]?
    
    required init(view: HomeViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        generateCategories()
        generateItems()
    }

    
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItemsInSection(in section: Int) -> Int {
        return self.categories?.count ?? 0
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    // MARK: - Mock methods
    func generateCategories() {
        categories = MockData.shared.categories
    }
    
    func generateItems() {
        items = MockData.shared.items
    }
}
