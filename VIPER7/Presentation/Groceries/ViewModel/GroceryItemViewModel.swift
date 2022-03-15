//
//  GroceryItemViewModel.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 04.02.2022.
//

import Foundation

struct GroceryItemViewModel {
    
    let id: Int
    let title: String
    let details: String
    let image: String
    
    init(using groceryModel: Grocery) {
        self.id = groceryModel.id
        self.title = groceryModel.title
        self.details = groceryModel.details
        self.image = groceryModel.image.name
    }
}
