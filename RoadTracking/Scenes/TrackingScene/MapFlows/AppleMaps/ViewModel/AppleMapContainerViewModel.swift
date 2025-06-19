//
//  AppleMapContainerViewModel.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 19.06.2025.
//

import MapKit

final class AppleMapContainerViewModel {
    private var mapView = MKMapView()

    func getAppleMap() -> MKMapView {
        return mapView
    }

    func addMarkOnTheMap(coordinate: CLLocationCoordinate2D, address: String) {
        let region = MKCoordinateRegion(center: coordinate,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = address
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }

    func setupLoadedMarks(coordinates: [LocationPoint]) {
        for point in coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude)
            mapView.addAnnotation(annotation)
        }
    }

    func removeAllMarks() {
        mapView.removeAnnotations(mapView.annotations)
    }
}
