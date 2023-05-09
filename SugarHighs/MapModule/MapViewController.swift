//
//  MapViewController.swift
//  SugarHighs
//
//  Created by Mark Golubev on 09/05/2023.
//

import UIKit
import SnapKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var presenter: MapViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter.getUserLocation()
        setupLocationManager()
        setupMapView()
    }
    
    // MARK: - Private prop
    let mapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    lazy var derectionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Directions", for: .normal)
        button.addTarget(self, action: #selector(didTapDerectionButton), for: .touchUpInside)
        button.backgroundColor = K.Design.buttonNormalBackgroundColor
        button.tintColor = .white
        button.layer.cornerRadius = 25
        return button
    }()
    
    // MARK: - Buttons actions
    @objc func didTapDerectionButton() {
        presenter.getDerectionsTapped()
    }


}

// MARK: - Setup View
private extension MapViewController {
    func setupView() {
        view.backgroundColor = K.Design.appBackgroundColor
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension MapViewController {
    func addSubview() {
        view.addSubview(mapView)
        mapView.addSubview(derectionsButton)
    }
}

// MARK: - Setup Layout
private extension MapViewController {
    func setupLayout() {
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        derectionsButton.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}

extension MapViewController: MapViewProtocol {
    func successAnnotationAdded() {
        mapView.showAnnotations(presenter.annotationArray, animated: true)
    }
    
    func successDirectionsAdded() {
        guard let polyline = presenter.minRoute?.polyline else { return }
        mapView.addOverlay(polyline)
    }
    
    
}
