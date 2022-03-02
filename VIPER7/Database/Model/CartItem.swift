//
//  CartItem.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import Foundation

struct CartItem {
    
    // MARK: - Public Properties
    
    public let skuId: String
    public let value: Int
    
    // MARK: - Initializers
    
    init(skuId: String, value: Int) {
        self.skuId = skuId
        self.value = value
    }
    
}
