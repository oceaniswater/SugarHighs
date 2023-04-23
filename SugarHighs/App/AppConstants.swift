//
//  AppConstants.swift
//  SugarHighs
//
//  Created by Mark Golubev on 23/04/2023.
//

import Foundation
import UIKit

struct K {
    struct Design {
        static let appBackgroundColor = UIColor(named: "appBackgroundColor")
//        static let appTextColor = UIColor(named: "appTextColor")
        
        static let buttonNormalBackgroundColor = UIColor(named: "buttonNormalBackgroundColor")
        
        static let cellBackgroundColor = UIColor(named: "cellBackgroundColor")
        static let cellBoundColor = UIColor(named: "cellBoundColor")
    }
    
    struct Network {
        static let serverAddress = "https://rickandmortyapi.com/api/"
    }
}
