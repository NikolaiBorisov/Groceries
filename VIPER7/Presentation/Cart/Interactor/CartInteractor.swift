//
//  CartInteractor.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import Foundation

final class CartInteractor {
    
    // MARK: - Public Properties
    
    public var database: CartDBProtocol
    
    // MARK: - Initializers
    
    init(database: CartDBProtocol) {
        self.database = database
    }
    
}

// MARK: - CartInteractorProtocol

extension CartInteractor {
    
    func getCartCount(closure: @escaping CartCountClosure) {
        database.getCount(closure: closure)
    }
    
    func getCartItem(skuId: String) -> CartItem {
        database.getCartItem(using: skuId)
    }
    
    func addToCart(skuItem: SkuItem) -> Bool {
        guard skuItem.quantity > 0 else { return database.delete(using: skuItem.skuId) }
        return database.updateCart(using: CartItem(skuId: skuItem.skuId, value: skuItem.quantity))
    }
    
}
