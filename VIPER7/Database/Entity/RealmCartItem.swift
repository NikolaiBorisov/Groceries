//
//  RealmCartItem.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import RealmSwift

final class RealmCartItem: Object {
    
    // MARK: - Public Properties
    
    @objc dynamic var skuId: String = ""
    @objc dynamic var value: Int = 0
    @objc dynamic var updated: Date = Date()
    
    // MARK: - Private Methods
    
    override static func primaryKey() -> String? {
        return "skuId"
    }
    
}

// MARK: - RealmCartItem

extension RealmCartItem {
    
    convenience init(cartItem: CartItem) {
        self.init()
        self.skuId = cartItem.skuId
        self.value = cartItem.value
    }
    
}

// MARK: - CarttItem

extension CartItem {
    
    init(realmCartItem: RealmCartItem) {
        self.skuId = realmCartItem.skuId
        self.value = realmCartItem.value
    }
    
}
