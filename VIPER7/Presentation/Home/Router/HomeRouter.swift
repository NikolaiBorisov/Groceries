//
//  HomeRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import UIKit

protocol HomeRouterProtocol {
    func routeToGroceriesListing(using category: (id: Int, title: String))
}

final class HomeRouter {
    
    // MARK: - Public Properties
    
    public var view: UIViewController
    
    // MARK: - Initializers
    
    init(view: UIViewController) {
        self.view = view
    }
    
}

// MARK: - HomeRouterProtocol

extension HomeRouter: HomeRouterProtocol {
    
    func routeToGroceriesListing(using category: (id: Int, title: String)) {
        let groceriesList = GroceriesListModuleBuilder.build(using: category)
        view.navigationController?.pushViewController(groceriesList, animated: true)
    }
    
}
