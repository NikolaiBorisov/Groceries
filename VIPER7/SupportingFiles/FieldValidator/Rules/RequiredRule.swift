//
//  RequiredRule.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

class RequiredRule: Rule {
    
    // MARK: - Private Properties
    
    private var message: String
    
    // MARK: - Initializers
    
    init(message: String = "Required") {
        self.message = message
    }
    
    // MARK: - Public Properties
    
    func validate(value: String) -> Bool {
        !value.isEmpty
    }
    
    func errorMessage() -> String {
        message
    }
    
}
