//
//  SignUpError.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import UIKit

struct SignUpError: Codable {
    let validationErrors: ValidationErrors
    
    enum CodingKeys: String, CodingKey {
        case validationErrors = "validation_errors"
    }
    
}

struct ValidationErrors: Codable {
    let name, email, password: [String]?
}
