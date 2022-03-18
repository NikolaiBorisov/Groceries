//
//  ValidationError.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

struct ValidationError: Codable {
    let message: String
    let statusCode: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case statusCode = "status_code"
    }
    
}
