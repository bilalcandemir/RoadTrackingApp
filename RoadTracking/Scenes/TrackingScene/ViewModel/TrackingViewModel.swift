//
//  TrackingViewModel.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit
import CoreLocation

enum MapType {
    case apple, google
}

enum UserTrackingOption {
    case start, stop
}

final class TrackingViewModel {

    // MARK: Properties
    var selectedMapType: MapType = .apple
    private var shouldTracking: UserTrackingOption = .start
    private lazy var locationManager = LocationManager()

    init() {
        locationManager.delegate = self
    }

    // MARK: Methods
    func getMapView() -> UIView {
        // TODO: This will be return selected map view
        switch selectedMapType {
        case .apple:
            return .init()
        case .google:
            return .init()
        }
    }

    func viewControllerDidLoad() {
        locationManager.startTracking()
    }

    func changeTrackingOption() {
        if shouldTracking == .start {
            shouldTracking = .stop
        } else {
            shouldTracking = .start
        }
    }

    func getTrackingOption() -> UserTrackingOption {
        shouldTracking
    }
}

extension TrackingViewModel: LocationManagerDelegate {
    func didUpdateLocation(_ location: CLLocation) {
        
    }
}
