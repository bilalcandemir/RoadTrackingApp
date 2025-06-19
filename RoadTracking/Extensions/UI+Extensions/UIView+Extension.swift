//
//  UIView+Extension.swift
//  RoadTracking
//
//  Created by Ahmet Bilal Candemir on 19.06.2025.
//

import UIKit

// This extension saves us from long constraint code blocks
extension UIView {
    public func configureConstraintToSuperview(with insets: UIEdgeInsets = .zero) {
        guard let view = superview else {
            fatalError("Couldn't find superview")
        }
        configureConstraintAlign(to: view, top: insets.top, left: insets.left, bottom: -insets.bottom, right: -insets.right)
    }

    private func configureConstraintAlign(to view: UIView, top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false

        var constraints: [NSLayoutConstraint] = []
        constraints.append(leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left))
        constraints.append(trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: right))
        constraints.append(topAnchor.constraint(equalTo: view.topAnchor, constant: top))
        constraints.append(bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom))

        NSLayoutConstraint.activate(constraints)
    }
}
