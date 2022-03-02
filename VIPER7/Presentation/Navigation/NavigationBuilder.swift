//
//  NavigationBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

final class NavigationBuilder {
    
    // MARK: - Public Methods
    
    static func build(rootVC: UIViewController) -> UINavigationController {
        let textStyleAttributes = setTextStyleAttributes()
        let largeTextStyleAttributes = setLargeTextStyleAttributes()
        let appearance = setNavBarAppearanceWith(
            textStyleAttributes: textStyleAttributes,
            largeTextStyleAttributes: largeTextStyleAttributes
        )
        let nc = setupNavigationController(for: rootVC, with: appearance)
        return nc
    }
    
    // MARK: - Private Methods
    
    private static func setTextStyleAttributes() -> [NSAttributedString.Key : Any] {
        let textStyleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.init(name: "AvenirNext-DemiBold", size: 22) ?? .systemFont(ofSize: 22)
        ]
        return textStyleAttributes
    }
    
    private static func setLargeTextStyleAttributes() -> [NSAttributedString.Key : Any] {
        let largeTextStyleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.init(name: "AvenirNext-DemiBold", size: 28) ?? .systemFont(ofSize: 28)
        ]
        return largeTextStyleAttributes
    }
    
    private static func setNavBarAppearanceWith(
        textStyleAttributes: [NSAttributedString.Key: Any],
        largeTextStyleAttributes: [NSAttributedString.Key: Any]
    ) -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGreen
        appearance.titleTextAttributes = textStyleAttributes
        appearance.largeTitleTextAttributes = largeTextStyleAttributes
        return appearance
    }
    
    private static func setupNavigationController(
        for rootVC: UIViewController,
        with appearance: UINavigationBarAppearance
    ) -> UINavigationController {
        let nc = UINavigationController(rootViewController: rootVC)
        nc.navigationBar.isTranslucent = false
        nc.navigationBar.prefersLargeTitles = true
        nc.navigationBar.barTintColor = .systemGreen
        nc.navigationBar.tintColor = .white
        nc.navigationBar.standardAppearance = appearance
        nc.navigationBar.compactAppearance = appearance
        nc.navigationBar.scrollEdgeAppearance = appearance
        return nc
    }
    
}
