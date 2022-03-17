//
//  UIStackViewFactory.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

final class UIStackViewFactory {
    
    static func generate(
        with axis: NSLayoutConstraint.Axis,
        subviews: [UIView],
        spacing: CGFloat,
        distribution: UIStackView.Distribution = .fillProportionally
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
    
}
