//
//  AttendanceSystemTests.swift
//  AttendanceSystemTests
//
//  Created by Paradox Space Rumy M1 on 22/7/22.
//

import XCTest
import CoreLocation
@testable import AttendanceSystem

class OfficeTimeLogicTests: XCTestCase {
    
    private var sut: OfficeTimeLogic!
    
    override func setUp() {
        super.setUp()
        self.sut = OfficeTimeLogic()
        self.sut.baseObj = MockBaseObj()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func test_DidUpdateLocations_ShouldUpdate_LocationDataModel() {
        let lati = 23.78, lon = 90.39
        let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: lati, longitude: lon), altitude: 14, horizontalAccuracy: .greatestFiniteMagnitude, verticalAccuracy: .greatestFiniteMagnitude, timestamp: Date())
        self.sut.didUpdateLocations(location: location)
        XCTAssertEqual(self.sut.locationDataModel.currentLatitude, lati)
        XCTAssertEqual(self.sut.locationDataModel.currentLongitude, lon)
        XCTAssertEqual(self.sut.locationDataModel.floor, 3)
    }
    
    func test_locationAuthorization_Should_Return_authorizedAlways() {
        let status = "authorizedAlways"
        self.sut.locationAuthorization(status: status)
        XCTAssert(self.sut.locationDataModel.locationStatus == status, "Location Status not update properly")
    }
    
    func test_calculateDistance_ShouldReturn_inside() {
        let lat = 23.7804
        let lon = 90.3941
        self.sut.calculateDistance(location: CLLocation(latitude: lat, longitude: lon))
        XCTAssertTrue(self.sut.locationDataModel.isInsideTheRegion,"He is inside the building but shows he is outside")
    }
    
    func test_calculateDistance_ShouldReturn_outside() {
        let lat = 23.75
        let lon = 90.3941
        self.sut.calculateDistance(location: CLLocation(latitude: lat, longitude: lon))
        XCTAssertFalse(self.sut.locationDataModel.isInsideTheRegion,"He is outside the building but shows he is inside")
    }
    
    func test_fetchStaffActivityOfDate_ShouldReturnNil() {
        
    }
    
    func test_fetchStaffActivityOfDate_ShouldReturnObj() {
        
    }
    
}
