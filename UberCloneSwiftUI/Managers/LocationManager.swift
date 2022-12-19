//
//  LocationManager.swift
//  UberCloneSwiftUI
//
//  Created by Appnap WS13 on 12/19/22.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.stopUpdatingLocation()
    }
}
