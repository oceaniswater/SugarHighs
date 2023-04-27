//
//  MockData.swift
//  SugarHighs
//
//  Created by Mark Golubev on 26/04/2023.
//

import Foundation

struct MockData {
    static var shared = MockData()
    var items = [Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                 Item(image: "quinspie", name: "Quins pie", tags: [.pies, .fruits], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 12.65),
                 Item(image: "princesicecream", name: "Princes ice cream", tags: [.icecream], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 7.65),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99)]
    
    var categories = [Category(image: "icecream", name: "Ice Cream", amount: "12"), Category(image: "sweets", name: "sweets", amount: "9"), Category(image: "donuts", name: "donuts", amount: "3"), Category(image: "pies", name: "pies", amount: "2")]
    
    var shops = [Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA", items: [Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                                                                                             Item(image: "quinspie", name: "Quins pie", tags: [.pies, .fruits], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 12.65),
                                                                                             Item(image: "princesicecream", name: "Princes ice cream", tags: [.icecream], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 7.65),
                                                                                             Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                                                                                             Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                                                                                             Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                                                                                             Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99),
                                                                                             Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"), price: 5.99)]),
                 Shop(name: "Sugar Daddy", image: "candyshop", location: "N1 7FA"),
                 Shop(name: "Lick my choco Donut", image: "candyshop", location: "TW8 2YH"),
                 Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"),
                 Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"),
                 Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"),
                 Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA"),
                 Shop(name: "Sweet Dreams", image: "candyshop", location: "TW8 2FA")]
    
    private init() { }
}
