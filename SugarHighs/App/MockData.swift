//
//  MockData.swift
//  SugarHighs
//
//  Created by Mark Golubev on 26/04/2023.
//

import Foundation

struct MockData {
    static var shared = MockData()
    var items = [Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(location: "TW8 0FA"), price: 5.99),
                                 Item(image: "quinspie", name: "Quins pie", tags: [.pies, .fruits], shop: Shop(location: "TW8 0FA"), price: 12.65),
                                 Item(image: "princesicecream", name: "Princes ice cream", tags: [.icecream], shop: Shop(location: "TW8 0FA"), price: 7.65),
                                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(location: "TW8 0FA"), price: 5.99),
                                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(location: "TW8 0FA"), price: 5.99),
                                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(location: "TW8 0FA"), price: 5.99),
                                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(location: "TW8 0FA"), price: 5.99),
                                 Item(image: "kingsdonut", name: "Kings donut", tags: [.donuts], shop: Shop(location: "TW8 0FA"), price: 5.99)]
    
    var categories = [Category(image: "icecream", name: "Ice Cream", amount: "12"), Category(image: "sweets", name: "sweets", amount: "9"), Category(image: "donuts", name: "donuts", amount: "3"), Category(image: "pies", name: "pies", amount: "2")]
    
    private init() { }
}
