//
//  Category.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation

// MARK: - Category

struct Categories: Codable {
    let data: [Category]
}

// MARK: - Category

struct Category: Codable {
    let id: Int
    let category: String
    let details: String
    let image: CategoryImage
}

// MARK: - CategoryImage

struct CategoryImage: Codable {
    let id: Int
    let name: String
}

//struct Category: Codable {
//
//    let id: Int
//    let category: String
//    let description: String
//    let imageId: String
//    let createdAt: String?
//    let updatedAt: String?
//    let categoryImage: CategoryImage
//
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case category
//        case description
//        case imageId = "image_id"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case categoryImage = "image"
//    }
//
//}
//
//struct CategoryImage: Codable {
//
//    let id: Int
//    let name: String
//    let createdAt: String?
//    let updatedAt: String?
//
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//    }
//
//}
