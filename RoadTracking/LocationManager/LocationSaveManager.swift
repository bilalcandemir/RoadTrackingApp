//
//  LocationSaveManager.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 19.06.2025.
//

import Foundation

final class LocationSaveManager {
    static let shared = LocationSaveManager()
    private let coordinatesKey = "savedCoordinates"

    private init() {}

    func saveCoordinates(coordinates: [LocationPoint]) {
        if let data = try? JSONEncoder().encode(coordinates) {
            UserDefaults.standard.set(data, forKey: coordinatesKey)
        }
    }

    func getCoordinates() -> [LocationPoint]? {
        guard let data = UserDefaults.standard.data(forKey: coordinatesKey) else { return nil }
        return try? JSONDecoder().decode([LocationPoint].self, from: data)
    }

    func removeAllCoordinates() {
        UserDefaults.standard.removeObject(forKey: coordinatesKey)
    }
}
