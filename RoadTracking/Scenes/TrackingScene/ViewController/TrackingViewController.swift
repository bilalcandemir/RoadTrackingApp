//
//  TrackingViewController.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit

final class TrackingViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var mapView: UIView!
    @IBOutlet private weak var stopButtonLabel: UILabel!
    @IBOutlet private weak var stopButtonImage: UIImageView!
    @IBOutlet private weak var trackingStateButtonContainerView: UIView!
    @IBOutlet private weak var clearButtonContainerView: UIView!

    // MARK: Properties
    private var viewModel = TrackingViewModel()

    // MARK: - Life Cycle
    override func setupUI() {
        super.setupUI()
        addMapView()
        viewModel.viewControllerDidLoad()
        trackingOptionStateChange()
        setupContainerViews()
    }

    // MARK: - Private Methods
    private func trackingOptionStateChange() {
        switch viewModel.getTrackingOption() {
        case .started:
            stopButtonLabel.text = "Stop Tracking"
            stopButtonImage.image = UIImage(systemName: "stop.circle")
            trackingStateButtonContainerView.backgroundColor = .blue
        case .stopped:
            stopButtonLabel.text = "Start Tracking"
            stopButtonImage.image = UIImage(systemName: "play.circle")
            trackingStateButtonContainerView.backgroundColor = .systemGreen
        }
    }

    // Setting tracking status and clear tracked pin's container view's corner radius
    private func setupContainerViews() {
        trackingStateButtonContainerView.layer.cornerRadius = 16
        clearButtonContainerView.layer.cornerRadius = 16
    }

    // Map view seperates from the view controller
    private func addMapView() {
        let mapContainerView = viewModel.getMapView()
        mapView.addSubview(mapContainerView)
        mapContainerView.configureConstraintToSuperview()
    }

    // MARK: - IBOutlet Actions
    @IBAction func clearLocationsButtonAction(_ sender: Any) {
        LocationSaveManager.shared.removeAllCoordinates()
        viewModel.removeAllMarks()
    }

    @IBAction func stopTrackingButtonAction(_ sender: Any) {
        viewModel.changeTrackingOption()
        trackingOptionStateChange()
    }
}
