//
//  LocationManager.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func didUpdateLocation(_ location: CLLocation,_ title: String)
}

final class LocationManager: NSObject, CLLocationManagerDelegate {

    // MARK: - Properties
    private let locationManager = CLLocationManager()
    weak var delegate: LocationManagerDelegate?
    var addressManager = AddressManager()

    // MARK: - Life Cycle
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 100
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
    }

    // MARK: - Tracking Methods
    func startTracking() {
        locationManager.startUpdatingLocation()
    }

    func stopTracking() {
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latest = locations.last else { return }
        addressManager.resolveAddress(for: latest) { [weak self] title in
            self?.delegate?.didUpdateLocation(latest, title ?? "")
        }
    }
}
