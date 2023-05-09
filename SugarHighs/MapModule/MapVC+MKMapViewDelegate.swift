//
//  MapVC+MKMapViewDelegate.swift
//  SugarHighs
//
//  Created by Mark Golubev on 09/05/2023.
//

import Foundation
import MapKit

extension MapViewController: MKMapViewDelegate {
    func setupMapView() {
        self.mapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        return renderer
    }
}
