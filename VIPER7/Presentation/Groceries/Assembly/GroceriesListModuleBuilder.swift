//
//  GroceriesListModuleBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 14.02.2022.
//

import UIKit

final class GroceriesListModuleBuilder {
    
    static func build(using category: (id: Int, title: String)) -> UIViewController {
        let vc = GroceriesListViewController()
        vc.title = category.title.uppercased()
        let imageIneractor = ImageInteractor(service: GroceryService.shared)
        let groceriesInteractor = GroceriesInteractor(service: GroceryService.shared, dataBase: RealmDatabase.shared)
        let useCase = (
            fetchGroceries: groceriesInteractor.getGroceries,
            fetchImage: imageIneractor.fetchImage,
            fetchThumbnail: imageIneractor.fetchThumbnail
        )
        let router = GroceriesListRouter(viewController: vc)
        let presenter = GroceriesListPresenter(categoryId: category.id, router: router, useCase: useCase)
        presenter.view = vc
        vc.presenter = presenter
        return vc
    }
    
}
