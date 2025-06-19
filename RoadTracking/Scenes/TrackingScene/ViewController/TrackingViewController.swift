//
//  TrackingViewController.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit

final class TrackingViewController: BaseViewController {
    @IBOutlet private weak var mapView: UIView!
    @IBOutlet private weak var stopButtonLabel: UILabel!
    @IBOutlet private weak var stopButtonImage: UIImageView!
    
    // MARK: Properties
    private var viewModel = TrackingViewModel()

    // MARK: - Life Cycle
    override func setupUI() {
        super.setupUI()
        let mapContainerView = viewModel.getMapView()
        mapView.addSubview(mapContainerView)
        mapContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mapContainerView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
                                     mapContainerView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
                                     mapContainerView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor),
                                     mapContainerView.topAnchor.constraint(equalTo: mapView.topAnchor)])
        viewModel.viewControllerDidLoad()
        trackingOptionStateChange()
    }

    private func trackingOptionStateChange() {
        switch viewModel.getTrackingOption() {
        case .started:
            stopButtonLabel.text = "Stop"
            stopButtonImage.image = UIImage(systemName: "stop.circle")
        case .stopped:
            stopButtonLabel.text = "Start"
            stopButtonImage.image = UIImage(systemName: "play.circle")
        }
    }

    @IBAction func clearLocationsButtonAction(_ sender: Any) {
    }

    @IBAction func stopTrackingButtonAction(_ sender: Any) {
        viewModel.changeTrackingOption()
        trackingOptionStateChange()
    }
}

import MapKit
final class AppleMapContainerView: UIView {

    var viewModel: AppleMapContainerViewModel

    init(viewModel: AppleMapContainerViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupMapView(mapView: viewModel.getAppleMap())
    }

    required init?(coder: NSCoder) {
        self.viewModel = .init()
        super.init(coder: coder)
        setupMapView(mapView: viewModel.getAppleMap())
    }

    private func setupMapView(mapView: MKMapView) {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

final class AppleMapContainerViewModel {
    private var mapView = MKMapView()

    func getAppleMap() -> MKMapView {
        return mapView
    }

    func addMarkOnTheMap(coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinate,
                                        latitudinalMeters: 1000,
                                        longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
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
}
