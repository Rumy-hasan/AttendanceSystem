//
//  BaseData.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import Foundation
import SwiftUI
import CoreLocation

class BaseData: ObservableObject{
    @Published var checkIn: Date
    @Published var checkOut: Date
    @Published var floorHeight: Double
    @Published var centerLat: Double
    @Published var centerLon: Double
    @Published var buildingRadius: Double
    
    init() {
        self.checkIn = UserDefaults.standard.value(forKey: Constants.checkIn.rawValue) as? Date ?? Date()
        self.checkOut = UserDefaults.standard.object(forKey: Constants.checkOut.rawValue) as? Date ?? Date()
        self.floorHeight = UserDefaults.standard.value(forKey: Constants.perFloorHeight.rawValue) as? Double ?? 4.0
        self.centerLat = UserDefaults.standard.value(forKey: Constants.centerLat.rawValue) as? Double ?? 0
        self.centerLon = UserDefaults.standard.value(forKey: Constants.centerLon.rawValue) as? Double ?? 0
        self.buildingRadius = UserDefaults.standard.value(forKey: Constants.buildingRadius.rawValue) as? Double ?? 0
    }
    
    func saveData() {
        UserDefaults.standard.set(checkIn, forKey: Constants.checkIn.rawValue)
        UserDefaults.standard.set(checkOut, forKey: Constants.checkOut.rawValue)
        UserDefaults.standard.set(floorHeight, forKey: Constants.perFloorHeight.rawValue)
        UserDefaults.standard.set(centerLat, forKey: Constants.centerLat.rawValue)
        UserDefaults.standard.set(centerLon, forKey: Constants.centerLon.rawValue)
        UserDefaults.standard.set(buildingRadius, forKey: Constants.buildingRadius.rawValue)
        UserDefaults.standard.set(true, forKey: Constants.isInitialSetupDone.rawValue)
        UserDefaults.standard.synchronize()
    }
    
}
