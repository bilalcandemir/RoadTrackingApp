//
//  TrackingViewModel.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit
import CoreLocation

final class TrackingViewModel {

    // MARK: Properties
    private var trackingOption: UserTrackingOption = .started
    private lazy var locationManager = LocationManager()
    private lazy var appleMapContainerViewModel = AppleMapContainerViewModel()
    private var coordinates: [LocationPoint] = []

    // MARK: Methods
    func getMapView() -> UIView {
        let appleMapContainerView = AppleMapContainerView(viewModel: appleMapContainerViewModel)
        if let coordinates = LocationSaveManager.shared.getCoordinates() {
            appleMapContainerViewModel.setupLoadedMarks(coordinates: coordinates)
        }
        return appleMapContainerView
    }

    func viewControllerDidLoad() {
        locationManager.startTracking()
        locationManager.delegate = self
    }

    func changeTrackingOption() {
        if trackingOption == .started {
            trackingOption = .stopped
            locationManager.stopTracking()
        } else {
            trackingOption = .started
            locationManager.startTracking()
        }
    }

    func getTrackingOption() -> UserTrackingOption {
        trackingOption
    }

    func removeAllMarks() {
        appleMapContainerViewModel.removeAllMarks()
    }
}

extension TrackingViewModel: LocationManagerDelegate {
    func didUpdateLocation(_ location: CLLocation,_ title: String) {
        coordinates.append(
            LocationPoint(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude,
                title: title
            )
        )
        LocationSaveManager.shared.saveCoordinates(coordinates: coordinates)
        appleMapContainerViewModel.addMarkOnTheMap(
            coordinate: location.coordinate,
            address: title
        )
    }
}
