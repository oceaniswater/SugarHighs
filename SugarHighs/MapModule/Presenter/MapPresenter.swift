//
//  MapPresenter.swift
//  SugarHighs
//
//  Created by Mark Golubev on 09/05/2023.
//

import Foundation
import CoreLocation
import MapKit

protocol MapViewProtocol: AnyObject {
    func successAnnotationAdded()
    func successDirectionsAdded()
}

protocol MapViewPresenterProtocol: AnyObject {
    init(view: MapViewProtocol, router: RouterProtocol, shop: Shop?)
    
    var view: MapViewProtocol? {get set}
    var router: RouterProtocol? {get set}
    
    var shop: Shop? {get set}
    var annotationArray: [MKPointAnnotation] {get set}
    var locationManager: CLLocationManager? {get set}
    var minRoute: MKRoute? {get set}
    
    func setupPlacemark(postcode: String)
    func setupPlacemarks()
    func getUserLocation()
    func getDerectionsTapped()
    
    
}

class MapPresenter: MapViewPresenterProtocol {

    weak var view: MapViewProtocol?
    var router: RouterProtocol?
    
    var shop: Shop?
    var annotationArray = [MKPointAnnotation]()
    var locationManager: CLLocationManager?
    var minRoute: MKRoute?
    
    required init(view: MapViewProtocol, router: RouterProtocol, shop: Shop?) {
        self.view = view
        self.router = router
        self.shop = shop
        
        setupPlacemarks()
        
    }
    
    func getUserLocation() {
         locationManager = CLLocationManager()
         locationManager?.requestAlwaysAuthorization()
         locationManager?.startUpdatingLocation()
     }
    
    func setupPlacemarks() {
        
        guard let adress = shop?.location else { return }
        setupPlacemark(postcode: adress)
    }
    
    func setupPlacemark(postcode: String) {
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(postcode) { placemarks, error in
            // error handler
            
            //success handler
            guard let placemarks = placemarks else { return }
            let placemark = placemarks.first
            let annotation = MKPointAnnotation()
            annotation.title = postcode
            
            guard let placemarkLocation = placemark?.location else { return }
            annotation.coordinate = placemarkLocation.coordinate
            
            self.annotationArray.append(annotation)
            
            self.view?.successAnnotationAdded()
        }
    }
    
    func createDerectionsRequest(startCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        
        let startLocation = MKPlacemark(coordinate: startCoordinate)
        let destinationLocation = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startLocation)
        request.destination = MKMapItem(placemark: destinationLocation)
        request.transportType = .walking
        request.requestsAlternateRoutes = true
        
        let direction = MKDirections(request: request)
        direction.calculate { [self] response, error in
            
            //error handler
            
            //success handler
            guard let response = response else { return }
            minRoute = response.routes[0]
            for route in response.routes {
                guard let minRouteDistance = minRoute?.distance  else { return }
                minRoute = (route.distance < minRouteDistance) ? route : minRoute
                
            }
            view?.successDirectionsAdded()
        }
        
    }
    
    func getDerectionsTapped() {
        for index in 0...annotationArray.count - 2 {
            createDerectionsRequest(startCoordinate: annotationArray[index].coordinate, destinationCoordinate: annotationArray[index + 1].coordinate)
        }
        view?.successAnnotationAdded()
        

    }
}
