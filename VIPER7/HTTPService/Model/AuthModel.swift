//
//  AuthModel.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

struct AuthModel: Codable {
    let name: String
    let email: String
    let password: String
    
    init(name: String = "", email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
}
