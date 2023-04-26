//
//  Item.swift
//  SugarHighs
//
//  Created by Mark Golubev on 25/04/2023.
//

import Foundation

enum Tags: String {
    case icecream = "Ice Cream"
    case donuts = "Donuts"
    case pies = "Pies"
    case sweets = "Sweets"
    case fruits = "Fruits"
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
