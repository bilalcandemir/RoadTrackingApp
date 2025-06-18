//
//  UIApplication+Extension.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 17.06.2025.
//

import UIKit

extension UIApplication {
    static var topViewController: UIViewController? {
        guard let rootVC = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?.rootViewController
        else {
            return nil
        }
        return getTopViewController(from: rootVC)
    }

    private static func getTopViewController(from viewController: UIViewController) -> UIViewController {
        if let nav = viewController as? UINavigationController {
            return getTopViewController(from: nav.visibleViewController ?? nav)
        } else if let tab = viewController as? UITabBarController {
            return getTopViewController(from: tab.selectedViewController ?? tab)
        } else if let presented = viewController.presentedViewController {
            return getTopViewController(from: presented)
        } else {
            return viewController
        }
    }
}
