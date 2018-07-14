//
//  UnitTesting_PracticeTests.swift
//  UnitTesting-PracticeTests
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import XCTest
@testable import UnitTesting_Practice

class UnitTesting_PracticeTests: XCTestCase {
    
    var sut: OnboardingState!
    
    var sut2 : OnboardingState_Untestable!

    override func setUp() {
        super.setUp()
        sut = OnboardingState()
        sut2 = OnboardingState_Untestable()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_shouldShowEnableLocationAlert_returnsTrue_when_locationServicesAreDisabled() {
        // WHEN
        MockedLocationManager.mockedLocationServicesEnabled = false
        
        // THEN
        XCTAssert(sut.shouldShowEnableLocationAlert(locationManager: MockedLocationManager.self))
    }
    
    func test_shouldShowEnableLocationAlert_returnsFalse_when_locationServicesAreEnabled() {
        MockedLocationManager.mockedLocationServicesEnabled = true
        XCTAssertFalse(sut.shouldShowEnableLocationAlert(locationManager: MockedLocationManager.self))
    }
    
    
    func testuntestable () {
  XCTAssert(sut2.shouldShowEnableLocationAlert(),"shouldShowEnableLocationAlert")
    }
    
    
}
