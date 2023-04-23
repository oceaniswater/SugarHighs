//
//  ModuleBuilder.swift
//  SugarHighs
//
//  Created by Mark Golubev on 21/04/2023.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createWelcomeModule(router: RouterProtocol) -> UIViewController
    func createSignInModule(router: RouterProtocol) -> UIViewController
//    func createCharactersModule(router: RouterProtocol) -> UIViewController
//    func createCharacterDetailModule(character: Character?, router: RouterProtocol) -> UIViewController
//
//    func createLocationsModule(router: RouterProtocol) -> UIViewController
//    func createLocationDetailModule(location: LocationResult?, router: RouterProtocol) -> UIViewController
//
//    func createTabBarModule(router: RouterProtocol, viewControllers: [UIViewController]) -> UITabBarController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
//    func createTabBarModule(router: RouterProtocol, viewControllers: [UIViewController]) -> UITabBarController {
//        let tabBar = MainTabBarController()
//        let presenter = TabBarPresenter(tabBar: tabBar, router: router, viewControllers: viewControllers)
//        tabBar.presenter = presenter
//        return tabBar
//        
//    }
//
    func createWelcomeModule(router: RouterProtocol) -> UIViewController {
        let view = WelcomeViewController()
        let presenter = WelcomePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createSignInModule(router: RouterProtocol) -> UIViewController {
        let view = SignInViewController()
        let presenter = SignInPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
//    
//    func createCharactersModule(router: RouterProtocol) -> UIViewController {
//        let view = CharactersViewController()
//        let networkService = NetworkService()
//        let presenter = CharactersPresenter(view: view, networkService: networkService, router: router)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createCharacterDetailModule(character: Character?, router: RouterProtocol) -> UIViewController {
//        let view = CharacterDetailViewController()
//        let networkService = NetworkService()
//        let presenter = CharacterDetailPresenter(view: view, networkService: networkService, router: router, character: character)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createLocationsModule(router: RouterProtocol) -> UIViewController {
//        let view = LocationsViewController()
//        let networkService = NetworkService()
//        let presenter = LocationsPresenter(view: view, networkService: networkService, router: router)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createLocationDetailModule(location: LocationResult?, router: RouterProtocol) -> UIViewController {
//        let view = LocationDetailViewController()
//        let networkService = NetworkService()
//        let presenter = LocationDetailPresenter(view: view, networkService: networkService, router: router, location: location)
//        view.presenter = presenter
//        return view
//    }
//    
//    
}
