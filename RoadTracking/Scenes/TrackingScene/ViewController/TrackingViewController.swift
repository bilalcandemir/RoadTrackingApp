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
        viewModel.viewControllerDidLoad()
        mapView = viewModel.getMapView()
    }

    private func trackingOptionStateChange() {
        switch viewModel.getTrackingOption() {
        case .start:
            stopButtonLabel.text = "Start"
            stopButtonImage.image = UIImage(systemName: "start")
        case .stop:
            stopButtonLabel.text = "Stop"
            stopButtonImage.image = UIImage(systemName: "stop")
        }
    }

    @IBAction func clearLocationsButtonAction(_ sender: Any) {
    }

    @IBAction func stopTrackingButtonAction(_ sender: Any) {
        viewModel.changeTrackingOption()
        trackingOptionStateChange()
    }
}
