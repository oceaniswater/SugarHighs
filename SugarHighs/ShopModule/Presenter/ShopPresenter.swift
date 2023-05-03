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
    
//    func numberOfSection() -> Int
//    func numberOfItemsInSection(in section: Int) -> Int
//
//    func getShops()
//    func tapToShop(shop: Shop)
//    func getFilteredShops(name: String)
    
    var shop: Shop? {get set}
    
    
}

class ShopPresenter: ShopViewPresenterProtocol {
    weak var view: ShopViewProtocol?
    var router: RouterProtocol?
    
    var shop: Shop?
    
    required init(view: ShopViewProtocol, router: RouterProtocol, shop: Shop?) {
        self.view = view
        self.router = router
        self.shop = shop
        
    }
    
    func setShop() {
        guard let shop = shop else { return }
        view?.setShop(shop: shop)
    }
}
