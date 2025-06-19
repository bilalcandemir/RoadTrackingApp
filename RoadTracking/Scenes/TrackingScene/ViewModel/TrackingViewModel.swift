//
//  TrackingViewModel.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit
import CoreLocation

struct LocationPoint: Codable {
    let latitude: Double
    let longitude: Double
}

enum MapType {
    case apple, google
}

enum UserTrackingOption {
    case started, stopped
}

final class TrackingViewModel {

    // MARK: Properties
    var selectedMapType: MapType = .apple
    private var trackingOption: UserTrackingOption = .started
    private lazy var locationManager = LocationManager()
    private lazy var appleMapContainerViewModel = AppleMapContainerViewModel()
    private var coordinates: [LocationPoint] = []

    // MARK: Methods
    func getMapView() -> UIView {
        // TODO: This will be return selected map view
        switch selectedMapType {
        case .apple:
            let appleMapContainerView = AppleMapContainerView(viewModel: appleMapContainerViewModel)
            if let coordinates = LocationSaveManager.shared.getCoordinates() {
                appleMapContainerViewModel.setupLoadedMarks(coordinates: coordinates)
            }
            return appleMapContainerView
        case .google:
            return .init()
        }
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
}

extension TrackingViewModel: LocationManagerDelegate {
    func didUpdateLocation(_ location: CLLocation) {
        coordinates.append(LocationPoint(latitude: location.coordinate.latitude,
                                         longitude: location.coordinate.longitude))
        LocationSaveManager.shared.saveCoordinates(coordinates: coordinates)
        switch selectedMapType {
        case .apple:
            appleMapContainerViewModel.addMarkOnTheMap(coordinate: location.coordinate)
        case .google:
            break
        }
    }
}
