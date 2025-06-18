//
//  MapSelectionViewController.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit

final class MapSelectionViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var chooseAppleMapsButton: UIButton!
    @IBOutlet private weak var chooseGoogleMapsButton: UIButton!
    
    // MARK: - Life Cycle
    override func setupUI() {
        super.setupUI()
        setupButtons()
    }

    // MARK: - Private Methods
    private func setupButtons() {
        chooseAppleMapsButton.layer.cornerRadius = 8
        chooseGoogleMapsButton.layer.cornerRadius = 8
    }

    // MARK: - Button Actions
    @IBAction func chooseAppleMapsAction(_ sender: Any) {
    }

    @IBAction func chooseGoogleMapsAction(_ sender: Any) {
    }
}
