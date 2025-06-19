//
//  AppleMapContainerViewModel.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 19.06.2025.
//

import MapKit

final class AppleMapContainerViewModel {

    // MARK: - Properties
    private var mapView = MKMapView()

    // MARK: - Methods
    func getAppleMap() -> MKMapView {
        return mapView
    }

    // This method add the annotations to map
    func addMarkOnTheMap(coordinate: CLLocationCoordinate2D, address: String) {
        let annotation = MKPointAnnotation()
        annotation.title = address
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        setRegionForMap(coordinate: coordinate)
    }

    // This method takes all coordinates from user defaults
    func setupLoadedMarks(coordinates: [LocationPoint]) {
        for point in coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
            mapView.addAnnotation(annotation)
        }
    }

    // This method calls when user taps the clear button
    func removeAllMarks() {
        mapView.removeAnnotations(mapView.annotations)
    }

    // This method centers and zooms the map automaticlly for user
    private func setRegionForMap(coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinate,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
}
