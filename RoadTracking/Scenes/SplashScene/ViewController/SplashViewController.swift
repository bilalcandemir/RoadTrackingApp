//
//  SplashViewController.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 18.06.2025.
//

import UIKit

final class SplashViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var appIconImageView: UIImageView!

    // MARK: - Life Cycle
    override func setupUI() {
        super.setupUI()
        animateLogo()
    }

    private func animateLogo() {
        UIView.animate(withDuration: 1.5, delay: 3, options: [.curveEaseInOut], animations: { [weak self] in
            self?.appIconImageView.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self?.appIconImageView.alpha = 0
        }) { _ in
            self.navigateToMapChoice()
        }
    }

    private func navigateToMapChoice() {
        Router.shared.openAsRoot(viewC: MapSelectionViewController())
    }
}
