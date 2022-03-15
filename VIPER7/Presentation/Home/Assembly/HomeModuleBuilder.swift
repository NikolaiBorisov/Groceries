//
//  HomeModuleBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import UIKit

final class HomeModuleBuilder {
    
    static func build(using navigationFactory: NavigationFactory) -> UIViewController {
        let view = HomeViewController()
        view.title = "Fresh Groceries"
        let router = HomeRouter(view: view)
        let homeInteractor = GroceriesInteractor(service: GroceryService.shared, dataBase: RealmDatabase.shared)
        let cartInteractor = CartInteractor(database: RealmDatabase.shared)
        let imageInteractor = ImageInteractor(service: GroceryService.shared)
        view.presenter = HomePresenter(view: view, router: router, useCase: (
            getCategories: homeInteractor.getCategories,
            // addToCart: cartInteractor.addToCart,
            getCartItem: cartInteractor.getCartItem,
            fetchThumbnail: imageInteractor.fetchThumbnail
        ))
        return navigationFactory(view)
    }
    
}
