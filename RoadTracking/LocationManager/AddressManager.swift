//
//  AddressManager.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 19.06.2025.
//

import CoreLocation

final class AddressManager {
    private let geocoder = CLGeocoder()

    func resolveAddress(for location: CLLocation, completion: @escaping (String?) -> Void) {
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                let address = [placemark.name, placemark.locality, placemark.country].compactMap { $0 }.joined(separator: ", ")
                completion(address)
            } else {
                completion(nil)
            }
        }
    }
}
