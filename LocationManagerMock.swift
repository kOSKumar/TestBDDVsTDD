//
//  LocationManagerMock.swift
//  BDDExampleTests
//
//  Created by ameet on 02/01/18.
//  Copyright © 2018 amit. All rights reserved.
//

import Foundation
@testable import BDDExample

class MockedLocationManager: LocationManagerType {
    static var mockedLocationServiceEnabled = true
    static func locationServicesEnabled() -> Bool {
        
        return mockedLocationServiceEnabled
    }
}
