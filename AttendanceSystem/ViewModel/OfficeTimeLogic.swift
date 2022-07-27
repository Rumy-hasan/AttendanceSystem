//
//  OfficeTimeLogic.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import Foundation
import MapKit
import SwiftUI
import Combine

final class OfficeTimeLogic:ObservableObject{
    private var currentLocation: LocationService!
    private let coreDataHandler: CoreDataHelperProtocol = CoreDataHelper.sharedInstance
    
    @Published var locationDataModel = LocationModel()
    @Published var currentStaffActivityEntity: StaffActivity?
    @Published var anyStaffActivityEntity: StaffActivity?
    
    var baseObj: BaseData = BaseData()
    
    init() {
        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: baseObj.centerLat, longitude: baseObj.centerLon), radius: baseObj.buildingRadius, identifier: "Observing Location")
        self.currentLocation = LocationService(region: region)
        self.currentLocation.delegate = self
    }
    
    func fetchStaffActivity(of: Date){
        self.anyStaffActivityEntity = self.coreDataHandler.fetchStaffActivity(ofDate: of)
    }
    
}


//MARK: LocationServiceProtocol
extension OfficeTimeLogic: LocationServiceProtocol{
    func didUpdateLocations(location: CLLocation) {
        self.locationDataModel.currentAltitude = location.altitude
        self.locationDataModel.currentLatitude = location.coordinate.latitude
        self.locationDataModel.currentLongitude = location.coordinate.longitude
        self.locationDataModel.floor = Int(Double(location.altitude)/baseObj.floorHeight)
    }
    
    func locationAuthorization(status: String) {
        self.locationDataModel.locationStatus = status
    }
    
    func calculateDistance(location:CLLocation){
        let temLocation = CLLocation(latitude: self.baseObj.centerLat, longitude: self.baseObj.centerLon)
        let distance = temLocation.distance(from: location)
        self.locationDataModel.isInsideTheRegion = distance > self.baseObj.buildingRadius ? false : true
        self.currentStaffActivityEntity = self.coreDataHandler.modifyStaffActivityRecord(isInRegion: self.locationDataModel.isInsideTheRegion)
    }
}
