//
//  Router.swift
//  SugarHighs
//
//  Created by Mark Golubev on 21/04/2023.
//

import UIKit

protocol RouterMain {
    var assembleyBuilder: AssembleyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
//    func initialViewController() -> UITabBarController?
    func initialViewController() -> UIViewController?
//    func showCharacters()
//    func showCharacterDetails(character: Character?)
//
//    func showLocations()
//    func showLocationDetail(location: LocationResult?)
//    func showCharacterDetailsFromLocation(character: Character?)
}

class Router: RouterProtocol {
    func initialViewController() -> UIViewController? {
        guard let welcomeVC = self.assembleyBuilder?.createWelcomeModule(router: self) else { return nil }
        return welcomeVC
    }
    
//    var characterNC: UINavigationController?
//    var locationNC: UINavigationController?
//    var homeNC: UINavigationController?
//
    var assembleyBuilder: AssembleyBuilderProtocol?
//
    init(assembleyBuilder: AssembleyBuilderProtocol) {
        self.assembleyBuilder = assembleyBuilder
    }
    
    
//    func initialViewController() -> UITabBarController? {
//            guard let mainViewController = self.assembleyBuilder?.createMainModule(router: self),
//                  let charactersViewController = self.assembleyBuilder?.createCharactersModule(router: self),
//                  let locationsViewController = self.assembleyBuilder?.createLocationsModule(router: self) else {return nil}
//
//            characterNC = UINavigationController(rootViewController: charactersViewController)
//            locationNC = UINavigationController(rootViewController: locationsViewController)
//            homeNC = UINavigationController(rootViewController: mainViewController)
//
//            guard let tabBarController = self.assembleyBuilder?.createTabBarModule(router: self, viewControllers: [characterNC!, homeNC!, locationNC!]) else {return nil}
//
//            return tabBarController
//    }
    
    // MARK: - Characters - Character Detail
//    func showCharacters() {
//        if let navigationController = navigationController {
//            guard let charactersViewController = self.assembleyBuilder?.createCharactersModule(router: self) else {return}
//            DispatchQueue.main.async {
//                navigationController.pushViewController(charactersViewController, animated: true)
//            }
//
//        }
//    }
    
//    func showCharacterDetails(character: Character?) {
//        if let characterNC = characterNC {
//            guard let detailViewController = self.assembleyBuilder?.createCharacterDetailModule(character: character, router: self) else {return}
//            DispatchQueue.main.async {
//                characterNC.pushViewController(detailViewController, animated: true)
//            }
//
//        }
//    }
    
//    func showCharacterDetailsFromLocation(character: Character?) {
//        if let locationNC = locationNC {
//            guard let detailViewController = self.assembleyBuilder?.createCharacterDetailModule(character: character, router: self) else {return}
//            DispatchQueue.main.async {
//                locationNC.pushViewController(detailViewController, animated: true)
//            }
//
//        }
//    }
    
    // MARK: - Locations - Location Detail
//    func showLocations() {
//        if let locationNC = navigationController {
//            guard let locationsViewController = self.assembleyBuilder?.createLocationsModule(router: self) else {return}
//            DispatchQueue.main.async {
//                navigationController.pushViewController(locationsViewController, animated: true)
//            }
//
//        }
//    }
    
//    func showLocationDetail(location: LocationResult?) {
//        if let locationNC = locationNC {
//            guard let detailViewController = self.assembleyBuilder?.createLocationDetailModule(location: location, router: self) else {return}
//            locationNC.pushViewController(detailViewController, animated: true)
//        }
//    }
//

    
    
}
