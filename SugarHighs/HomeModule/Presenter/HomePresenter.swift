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
        categories = [Category(image: "icecream", name: "Ice Cream", amount: "12"), Category(image: "sweets", name: "sweets", amount: "9"), Category(image: "donuts", name: "donuts", amount: "3"), Category(image: "pies", name: "pies", amount: "2")]
    }
    
    func generateItems() {
        let shop1 = Shop(location: "TW8 0FA")
        let shop2 = Shop(location: "N1 0WS")
        items = [Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: shop1, price: 5.99),
                 Item(image: "quinspie", name: "Quins pie", tags: [.pies, .fruits], shop: shop2, price: 12.65),
                 Item(image: "princesicecream", name: "Princes ice cream", tags: [.icecream], shop: shop1, price: 7.65),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: shop1, price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: shop1, price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: shop1, price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: shop1, price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: shop1, price: 5.99)]
    }
}
