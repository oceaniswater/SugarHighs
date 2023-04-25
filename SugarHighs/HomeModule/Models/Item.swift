//
//  Item.swift
//  SugarHighs
//
//  Created by Mark Golubev on 25/04/2023.
//

import Foundation

enum Tags {
    case icecream
    case donuts
    case pies
    case sweets
    case fruits
}

struct Item {
    let image: String
    let name: String
    let tags: [Tags]
    let shop: Shop
    let price: Double
}

struct Shop {
    let location: String
}
