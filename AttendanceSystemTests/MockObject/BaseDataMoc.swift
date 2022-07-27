//
//  BaseDataMoc.swift
//  AttendanceSystemTests
//
//  Created by Paradox Space Rumy M1 on 27/7/22.
//

import Foundation
@testable import AttendanceSystem

class MockBaseObj:BaseData{
    override init() {
        super.init()
        self.checkIn = Date()
        self.checkOut = Date()
        self.centerLat = 23.7804
        self.centerLon = 90.3941
        self.buildingRadius = 4
        self.floorHeight = 16
    }
}
