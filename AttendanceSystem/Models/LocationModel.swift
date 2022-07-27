//
//  LocationServiceModel.swift
//  AttendanceSystem
//
//  Created by Paradox Space Rumy M1 on 26/7/22.
//

import CoreLocation

struct LocationModel {
    var locationStatus: String = ""
    var currentLatitude: CLLocationDegrees = 0.0
    var currentLongitude: CLLocationDegrees = 0.0
    var currentAltitude: CLLocationDistance = 0.0
    var isInsideTheRegion: Bool = false
    var floor: Int = 0
}
