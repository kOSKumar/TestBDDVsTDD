//
//  LocationManagerTest.swift
//  BDDExampleTests
//

import XCTest
@testable import BDDExample

class LocationManagerTest: XCTestCase {
    
    var sut: OnboardingState!

    override func setUp() {
        super.setUp()

        sut = OnboardingState()
    }
    
    override func tearDown() {
        
        sut = nil
        super.tearDown()
    }

    func test_shouldShowEnableLocationAlert_whenLocationServiceDisabled() {
        
        MockedLocationManager.mockedLocationServiceEnabled = false
        XCTAssert(sut.shouldShowEnableLocationAlert(locationManager: MockedLocationManager.self))
    }
    
    func test_shouldShowEnableLocationAlert_whenLocationServiceEnabled() {
        
        MockedLocationManager.mockedLocationServiceEnabled = true
        XCTAssert(sut.shouldShowEnableLocationAlert(locationManager: MockedLocationManager.self))
    }
}
