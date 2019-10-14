//
//  SecondViewController.swift
//  Kanto
//
//  Created by Tyrone STEPHEN on 2019/10/14.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    //MARK: properties
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius:Double = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial location in 84 Albertina
        let initialLocation = CLLocationCoordinate2D(latitude: -26.205013, longitude: 28.040180)
        centerMapOnLocation(location: initialLocation)
        
        // add map pin (annotation)
        addMapAnnotation(coordinate: initialLocation, title: "WeThinkCode_", subtitle: "Learn to code here")
    }
    
    @IBAction func mapViewChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
    }
    
    private func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let coordinateRegion = MKCoordinateRegion.init(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    private func addMapAnnotation(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)
    }
    
}

