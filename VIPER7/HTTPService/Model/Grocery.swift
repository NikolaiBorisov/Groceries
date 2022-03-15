//
//  Grocery.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 15.03.2022.
//

import Foundation

// MARK: - Grocery

struct Grocery: Codable {
    let id: Int
    let title: String
    let image: GroceryImage
    let details: String
}

// MARK: - GroceryImage

struct GroceryImage: Codable {
    let id: Int
    let name, createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
