//
//  TestCoreDataHelper.swift
//  AttendanceSystemTests
//
//  Created by Paradox Space Rumy M1 on 27/7/22.
//

import XCTest

class TestCoreDataHelper: XCTestCase {

    private var sut:MockCoreDataHelper!
    
    override func setUp() {
        super.setUp()
        self.sut = MockCoreDataHelper()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func test_Create_Should_Return_AObject(){
        let date = Date()
        let newObj = self.sut.create(ofDate: date)
        XCTAssertNotNil(newObj, "newObj should not be nil")
        XCTAssertTrue(newObj.date == Date().dateString())
        XCTAssertEqual(newObj.checkin, date)
    }
    
    func test_fetchStaffActivity_Should_ReturnObject() {
        let date = Calendar.current.date(byAdding: .day, value: -10, to: Date())!
        let _ = self.sut.create(ofDate: date)
        XCTAssertNotNil(self.sut.fetchStaffActivity(ofDate: date), "Should return a staff object")
    }
    
    func test_fetchStaffActivity_Should_ReturnNill() {
        let date = Calendar.current.date(byAdding: .day, value: -10, to: Date())!
        XCTAssertNil(self.sut.fetchStaffActivity(ofDate: date), "Should return a nill")
    }
    

}
