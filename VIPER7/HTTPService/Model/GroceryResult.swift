//
//  GroceryResult.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 04.02.2022.
//

import UIKit

struct GroceryResult: Codable {
    let groceries: [Grocery]
}

struct Grocery: Codable {
    let skuId: String
    let title: String
    let image: String
    let details: String
    let price: Double
    
    private enum CodingKeys: String, CodingKey {
        case skuId = "sku-id"
        case title
        case image = "product_image"
        case details
        case price
    }
}
