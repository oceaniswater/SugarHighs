//
//  Shop.swift
//  SugarHighs
//
//  Created by Mark Golubev on 27/04/2023.
//

import Foundation

struct Shop {
    let name: String
    let image: String
    let location: String
    let items: [Item?]
    
    init(name: String, image: String, location: String, items: [Item] = []) {
        self.name = name
        self.image = image
        self.location = location
        self.items = items
    }
}
