//
//  LocationManagerDemo.swift
//  BDDExample
//

import Foundation
import CoreLocation

protocol LocationManagerType: class {
    static func locationServicesEnabled() -> Bool
}

extension CLLocationManager: LocationManagerType {}

struct OnboardingState {
    
    func shouldShowEnableLocationAlert(locationManager: LocationManagerType.Type = CLLocationManager.self) -> Bool {
        
        guard locationManager.locationServicesEnabled() else { return true }
        return false
    }
}
