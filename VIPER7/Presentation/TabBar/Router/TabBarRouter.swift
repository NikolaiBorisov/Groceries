//
//  TabBarRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import UIKit

final class TabBarRouter {
    
    // MARK: - Public Properties
    
    typealias Submodules = (
        home: UIViewController,
        cart: UIViewController,
        profile: UIViewController
    )
    public var viewController: UIViewController
    
    // MARK: - Initializers
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

// MARK: - TabBarRouter

extension TabBarRouter {
    
    static func tabs(using submodules: Submodules) -> GroceryTabs {
        let homeTabBArItem = UITabBarItem(title: "Home", image: AppImage.house, tag: 11)
        let cartTabBArItem = UITabBarItem(title: "Cart", image: AppImage.cart, tag: 12)
        let profileTabBArItem = UITabBarItem(title: "Profile", image: AppImage.profile, tag: 13)
        
        submodules.home.tabBarItem = homeTabBArItem
        submodules.cart.tabBarItem = cartTabBArItem
        submodules.profile.tabBarItem = profileTabBArItem
        return (
            home: submodules.home,
            cart: submodules.cart,
            profile: submodules.profile
        )
    }
    
}
