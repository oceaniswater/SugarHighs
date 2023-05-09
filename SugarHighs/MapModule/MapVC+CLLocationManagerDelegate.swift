//
//  MapVC+CLLocationManagerDelegate.swift
//  SugarHighs
//
//  Created by Mark Golubev on 09/05/2023.
//

import Foundation
import CoreLocation
import MapKit


extension MapViewController: CLLocationManagerDelegate {
    func setupLocationManager() {
        self.presenter.locationManager?.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            let annotation = MKPointAnnotation()
            annotation.title = "Me"
            
            annotation.coordinate = location.coordinate
            
            self.presenter.annotationArray.append(annotation)
            self.successAnnotationAdded()
        }
    }
}
