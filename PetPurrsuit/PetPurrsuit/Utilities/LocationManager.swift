//
//  LocationManager.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import CoreLocation
import SwiftUI

final class LocationManager: NSObject, ObservableObject {
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastSeenLocation: CLLocation?

    private let clLocationManager: CLLocationManager

    init(authorizationStatus: CLAuthorizationStatus = .notDetermined) {
        self.authorizationStatus = authorizationStatus
        self.clLocationManager = CLLocationManager()
        super.init()
        clLocationManager.delegate = self
        self.authorizationStatus = clLocationManager.authorizationStatus
        clLocationManager.startUpdatingLocation()
    }

    func updateAuthorizationStatus() {
        authorizationStatus = clLocationManager.authorizationStatus
    }
}

extension LocationManager {
    var locationIsDisabled: Bool {
        authorizationStatus == .denied ||
        authorizationStatus == .notDetermined ||
        authorizationStatus == .restricted
    }
}

extension LocationManager : CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        updateAuthorizationStatus()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location retrieving failed due to: \(error.localizedDescription)")
    }
}

