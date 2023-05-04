//
//  ShopPresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 27/04/2023.
//

import Foundation

protocol ShopViewProtocol: AnyObject {
    func success()
    func setShop(shop: Shop)
}

protocol ShopViewPresenterProtocol: AnyObject {
    init(view: ShopViewProtocol, router: RouterProtocol, shop: Shop?)
    
    func setShop()
    func getTags()
    
    func numberOfSection() -> Int
    func numberOfItemsInSection(in section: Int) -> Int
//
//    func getShops()
//    func tapToShop(shop: Shop)
//    func getFilteredShops(name: String)
    
    var shop: Shop? {get set}
    var tags: [Tags?]? {get set}
    
    
}

class ShopPresenter: ShopViewPresenterProtocol {
    weak var view: ShopViewProtocol?
    var router: RouterProtocol?
    
    var shop: Shop?
    var tags: [Tags?]?
    
    required init(view: ShopViewProtocol, router: RouterProtocol, shop: Shop?) {
        self.view = view
        self.router = router
        self.shop = shop
        
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    func numberOfItemsInSection(in section: Int) -> Int {
        return tags?.count ?? 0
    }
    
    func setShop() {
        guard let shop = shop else { return }
        view?.setShop(shop: shop)
        getTags()
    }
    
    func getTags() {
        var temp = Set<Tags>()
        guard let shop = shop else { return }
        for case let item? in shop.items {
            for case let tag? in item.tags {
                temp.insert(tag)
            }
        }
        tags = Array(temp)
    }
}
