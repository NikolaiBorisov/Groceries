//
//  SingleCategoryResult.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 15.03.2022.
//

import Foundation

// MARK: - SingleCategoryResult

struct SingleCategoryResult: Codable {
    let category: Category
    
    private enum CodingKeys: String, CodingKey {
        case category = "data"
    }
    
}
