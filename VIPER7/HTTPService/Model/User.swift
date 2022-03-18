//
//  User.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case username = "name"
    }
    
}
