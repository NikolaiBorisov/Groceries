//
//  TabBarModuleBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import UIKit

final class TabBarModuleBuilder {
    
    static func build() -> UITabBarController {
        let submodules = (
            home: HomeModuleBuilder.build(using: NavigationBuilder.build),
            cart: CartModuleBuilder.build(using: NavigationBuilder.build),
            profile: ProfileModuleBuilder.build(using: NavigationBuilder.build)
        )
        let tabs = TabBarRouter.tabs(using: submodules)
        let interactor = CartInteractor(database: RealmDatabase.shared)
        let presenter = TabBarPresenter(useCase: (
            getCartCount: interactor.getCartCount, ()
        ))
        let tabBarVC = GroceryTabBarController(tabs: tabs, presenter: presenter)
        presenter.view = tabBarVC
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.backgroundColor = .systemGreen
        return tabBarVC
    }
    
}
