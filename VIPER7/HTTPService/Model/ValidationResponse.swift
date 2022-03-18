//
//  ValidationResponse.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

struct ValidationResponse: Codable {
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case user = "data"
    }
    
}
