//
//  LocationManager.swift
//  UnitTesting-Practice
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation
import CoreLocation


struct OnboardingState_Untestable {
    func shouldShowEnableLocationAlert() -> Bool {
        guard CLLocationManager.locationServicesEnabled() else { return true }
        return false
    }
}

struct OnboardingState {
    func shouldShowEnableLocationAlert(locationManager: LocationManagerType.Type = CLLocationManager.self) -> Bool {
        guard locationManager.locationServicesEnabled() else { return true }
        return false
    }
    
}

protocol LocationManagerType: class {
    static func locationServicesEnabled() -> Bool
}

extension CLLocationManager: LocationManagerType {

}


//
//The problem of this implementation is that the shouldShowEnableLocationAlert method uses CLLocationManager internally to return it's output. Therefore, to test this method we need mock and inject this dependency. Defining a protocol that CLLocationManager can automatically conform to:


class MockedLocationManager: LocationManagerType {
    static var mockedLocationServicesEnabled = true
    static func locationServicesEnabled() -> Bool {
        return mockedLocationServicesEnabled
    }
}
