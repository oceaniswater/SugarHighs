//
//  TabBarViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var presenter: TabBarPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarApperance()
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewControllers = presenter?.generateTabBarItems()
//        selectedIndex = 1
        
    }
    
    // for adopt tab bar color scheme for dark/light mode
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                let color = K.Design.cellBackgroundColor ?? .white
                let roundLayer = self.tabBar.layer.sublayers?.first(where: { $0 is CAShapeLayer }) as? CAShapeLayer
                roundLayer?.fillColor = color.cgColor
                
                roundLayer?.strokeColor = K.Design.cellBoundColor?.cgColor
                roundLayer?.lineWidth = 2
                
            }
        }
    }
    
    private func setTabBarApperance() {
        let positionOnX: CGFloat = 10
        let width = tabBar.bounds.width - positionOnX * 2
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 5
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = K.Design.buttonNormalBackgroundColor // Set color of selected elements
        tabBar.unselectedItemTintColor = .gray // Set color of unselected elements
        
    }
    
}

extension TabBarViewController: TabBarProtocol {
    
}
