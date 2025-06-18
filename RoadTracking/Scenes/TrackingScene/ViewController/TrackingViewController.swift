//
//  TrackingViewController.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit

final class TrackingViewController: BaseViewController {

    // MARK: Properties
    private var viewModel = TrackingViewModel()

    // MARK: - Life Cycle
    override func setupUI() {
        super.setupUI()
        viewModel.viewControllerDidLoad()
    }
}
