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
    func popToRootViewController(animated: Bool = true) {
        if let topViewController = UIApplication.topViewController,
           let navigationController = topViewController.navigationController {
            navigationController.popToRootViewController(animated: animated)
        }
    }

    func openAsRoot(viewC: UIViewController) {
        let navVC = UINavigationController.init(rootViewController: viewC)
        guard let window = UIApplication.shared.delegate?.window as? UIWindow else { return }
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    }

    func push(viewC: UIViewController, fromViewController: UIViewController? = nil,
              animated: Bool = true, shouldPopToRoot: Bool = false) {
        guard let navigationController =
                fromViewController?.navigationController ?? self.getCurrentNavigationController() else {
            return }
        if shouldPopToRoot {
            navigationController.popToRootViewController(animated: false)
        }
        navigationController.pushViewController(viewC, animated: animated)
    }

    func present(viewC: UIViewController, fromViewController: UIViewController? = nil,
                 animated: Bool = true,
                 isWithNavigationController: Bool = false) {
        guard let navigationController =
                fromViewController?.navigationController ?? self.getCurrentNavigationController() else {
            return }
        if isWithNavigationController {
            let newC = UINavigationController.init(rootViewController: viewC)
            newC.modalPresentationStyle = .fullScreen
            navigationController.present(newC, animated: animated)
        } else {
            navigationController.present(viewC, animated: animated)
        }
    }

    func getCurrentNavigationController() -> UINavigationController? {
        guard let topViewController = UIApplication.topViewController else { return nil }
        if let navigationController = topViewController.navigationController {
            return navigationController
        }
        return nil
    }
}
