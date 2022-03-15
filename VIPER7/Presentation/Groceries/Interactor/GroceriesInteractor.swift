//
//  GroceriesInteractor.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import Foundation

typealias SkuItem = (skuId: String, quantity: Int)

final class GroceriesInteractor {
    
    // MARK: - Public Properties
    
    public var service: GroceriesAPI
    public var dataBase: CartDBProtocol
    
    // MARK: - Initializers
    
    init(service: GroceriesAPI, dataBase: CartDBProtocol) {
        self.service = service
        self.dataBase = dataBase
    }
    
}

// MARK: - HomeInteractorProtocol

extension GroceriesInteractor {
    
    func getCategories(completion: @escaping CategoriesClosure) {
        service.fetchCategories(completion: completion)
    }
    
    func getGroceries(categoryId: Int, completion: @escaping GroceriesClosure) -> (Void) {
        service.fetchGroceries(categoryId: categoryId, completion: completion)
    }
    
}
