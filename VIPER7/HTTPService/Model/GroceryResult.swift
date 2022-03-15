//
//  GroceryResult.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 04.02.2022.
//

import UIKit

// MARK: - GroceryResult

struct GroceryResult: Codable {
    let groceries: [Grocery]
    
    enum CodingKeys: String, CodingKey {
        case groceries = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        groceries = try container.decode(Array<Grocery>.self, forKey: .groceries)
    }
    
}
