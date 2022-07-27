//
//  LocationService.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import CoreLocation
import SwiftUI

//MARK: protocol to acess the state
@objc protocol LocationServiceProtocol{
    @objc optional func locationAuthorization(status: String)
    func didUpdateLocations(location: CLLocation)
    func calculateDistance(location:CLLocation)
}


class LocationService: NSObject{
    //private var locationManager: LocationManager!
    private var locationManager: CLLocationManager!
    var locationStatus: CLAuthorizationStatus?
    weak var delegate: LocationServiceProtocol!
    
    var currentStatus: String {
        guard let status = self.locationStatus else {
            return "unknown"
        }
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
    
    init(locationManager:CLLocationManager? = nil, region: CLCircularRegion) {
        super.init()
        self.locationManager = locationManager ?? CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.allowsBackgroundLocationUpdates = true
        self.locationManager.showsBackgroundLocationIndicator = true
        self.locationManager.distanceFilter = 3.0
        region.notifyOnEntry = true
        region.notifyOnExit = true
        self.locationManager.startMonitoring(for: region)
        self.locationManager.startUpdatingLocation()
    }
    
    
}

extension LocationService: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        locationStatus = status
        self.delegate.locationAuthorization?(status: currentStatus)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.delegate.didUpdateLocations(location: location)
        self.delegate.calculateDistance(location: location)
    }
    
    //MARK: not work
//    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
//        self.isInsideTheRegion = true
//        print("Enter the region")
//    }
//
//    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
//        self.isInsideTheRegion = false
//        print("Exit the region")
//    }
}
