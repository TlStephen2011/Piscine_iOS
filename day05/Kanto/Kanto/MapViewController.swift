//
//  SecondViewController.swift
//  Kanto
//
//  Created by Tyrone STEPHEN on 2019/10/14.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    //MARK: properties
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius:Double = 500
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial location in 84 Albertina
        let initialLocation = CLLocationCoordinate2D(latitude: -26.205013, longitude: 28.040180)
        centerMapOnLocation(location: initialLocation)
        
        // add map pin (annotation)
        addMapAnnotation(coordinate: initialLocation, title: "WeThinkCode_", subtitle: "Learn to code here")
        
        // handle user location and permissions
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    //MARK: actions
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
    
    @IBAction func onRequestCurrentLocation(_ sender: UIButton) {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.startUpdatingLocation()
            if (currentLocation != nil) {
                centerMapOnLocation(location: currentLocation!)
            }
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

extension MapViewController {
//    private func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .denied:
//            fatalError("This app requires your location")
//        case .authorizedWhenInUse:
//            break
//        case .authorizedAlways:
//            break
//        case .restricted:
//            fatalError("This app requires your location")
//        default:
//            break
//        }
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue:CLLocationCoordinate2D = locationManager.location?.coordinate else {return}
        print(locValue)
        currentLocation = locValue
    }
    
}

