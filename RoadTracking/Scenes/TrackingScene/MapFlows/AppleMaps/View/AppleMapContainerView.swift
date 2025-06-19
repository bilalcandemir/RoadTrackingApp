//
//  AppleMapContainerView.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 19.06.2025.
//

import UIKit
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
