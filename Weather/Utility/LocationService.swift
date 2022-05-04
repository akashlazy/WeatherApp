//
//  LocationService.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation
import CoreLocation

class LocationService {
    
    func getCurrentLocation(completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            let currentLoc = locationManager.location?.coordinate
            completion(currentLoc)
        case .notDetermined:
            debugPrint("")
        case .restricted:
            debugPrint("")
        case .denied:
            debugPrint("")
        @unknown default:
            debugPrint("")
        }
    }
}
