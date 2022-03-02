//
//  GroceryItemViewModel.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 04.02.2022.
//

import Foundation

struct GroceryItemViewModel {
    
    let id: String
    let title: String
    let details: String
    let image: String
    let price: String
    let cartValue: CartValueViewModel
    
    init(using groceryModel: Grocery, cartItem: CartItem) {
        self.id = groceryModel.skuId
        self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image
        self.price = "$ \(groceryModel.price)"
        self.cartValue = CartValueViewModel(id: cartItem.skuId, stepValue: cartItem.value)
    }
}
