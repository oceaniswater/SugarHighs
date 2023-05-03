//
//  ShopsPresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import Foundation

protocol ShopsViewProtocol: AnyObject {
    func success()
}

protocol ShopsViewPresenterProtocol: AnyObject {
    init(view: ShopsViewProtocol, router: RouterProtocol)
    
    func numberOfSection() -> Int
    func numberOfItemsInSection(in section: Int) -> Int
    
    func getShops()
    func tapToShop(shop: Shop)
    func getFilteredShops(name: String)
    
    var shops: [Shop?] {get set}
    
    
}

class ShopsPresenter: ShopsViewPresenterProtocol {
    weak var view: ShopsViewProtocol?
    var router: RouterProtocol?
    
    var shops: [Shop?] = []
    
    required init(view: ShopsViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        
        getShops()
    }
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItemsInSection(in section: Int) -> Int {
        return self.shops.count
    }
    
    func getShops() {
        DispatchQueue.global(qos: .utility).async {
            self.shops = MockData.shared.shops
            self.view?.success()
        }
    }
    
    func getFilteredShops(name: String) {
        self.shops = MockData.shared.shops
        let tmpShop = self.shops.filter {$0!.name.contains(name)}
        shops = tmpShop
        self.view?.success()
    }
    
    func tapToShop(shop: Shop) {
        router?.shopViewController(shop: shop)
    }

}
