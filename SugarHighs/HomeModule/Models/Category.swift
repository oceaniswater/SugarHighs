//
//  Category.swift
//  SugarHighs
//
//  Created by Mark Golubev on 25/04/2023.
//

import Foundation

struct Category {
    let image: String
    let name: String
    let amount: String
    var description: String {
            return "\(name.capitalizedSentence) - \(amount) items"
    }
    
    init(image: String, name: String, amount: String) {
        self.image = image
        self.name = name
        self.amount = amount
    }
}
