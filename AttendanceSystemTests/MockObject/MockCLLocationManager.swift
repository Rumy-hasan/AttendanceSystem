//
//  MockCLLocationManager.swift
//  AttendanceSystemTests
//
//  Created by Paradox Space Rumy M1 on 27/7/22.
//

import CoreLocation


protocol LocationManager {
    var location: CLLocation? { get }
    var delegate: CLLocationManagerDelegate? { get set }
    var distanceFilter: CLLocationDistance { get set }
    var pausesLocationUpdatesAutomatically: Bool { get set }
    var allowsBackgroundLocationUpdates: Bool { get set }
    var showsBackgroundLocationIndicator: Bool {get set}
    var desiredAccuracy: CLLocationAccuracy {get set}
    
    func requestWhenInUseAuthorization()
    func startUpdatingLocation()
    func stopUpdatingLocation()
    func startMonitoring(for region: CLRegion)
    func requestAlwaysAuthorization()
    
    func getAuthorizationStatus() -> CLAuthorizationStatus
    func isLocationServicesEnabled() -> Bool
}

extension CLLocationManager:LocationManager{
    
    func getAuthorizationStatus() -> CLAuthorizationStatus {
        CLLocationManager.authorizationStatus()
    }
    
    func isLocationServicesEnabled() -> Bool {
        CLLocationManager.locationServicesEnabled()
    }
}

