//
//  Categories.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation

// MARK: - Categories

struct Categories: Codable {
    let data: [Category]
}

// MARK: - Category

struct Category: Codable {
    let id: Int
    let category: String
    let details: String
    let image: CategoryImage
    let groceries: GroceryResult?
}

// MARK: - CategoryImage

struct CategoryImage: Codable {
    let id: Int
    let name: String
}
