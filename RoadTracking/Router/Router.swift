//
//  Router.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 17.06.2025.
//

import UIKit

final class Router {
    static let shared = Router()
}

extension Router {
    func openAsRoot(viewC: UIViewController) {
        guard let window = UIApplication.shared.delegate?.window as? UIWindow else { return }
        window.rootViewController = viewC
        window.makeKeyAndVisible()
    }

    func present(viewC: UIViewController, fromViewController: UIViewController? = nil,
                 animated: Bool = true,
                 isWithNavigationController: Bool = false) {
        guard let navigationController =
                fromViewController?.navigationController else {
            return }
        if isWithNavigationController {
            let newC = UINavigationController.init(rootViewController: viewC)
            newC.modalPresentationStyle = .fullScreen
            navigationController.present(newC, animated: animated)
        } else {
            navigationController.present(viewC, animated: animated)
        }
    }
}
