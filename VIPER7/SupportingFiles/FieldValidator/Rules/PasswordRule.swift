//
//  PasswordRule.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

final class PasswordRule: Rule {
    
    // MARK: - Public Properties
    
    static let regex = "^.{6,12}$"
    
    // MARK: - Private Properties
    
    private var message: String
    
    // MARK: - Initializers
    
    init(message: String = "Must be between 6 and 12 characters") {
        self.message = message
    }
    
    // MARK: - Public Methods
    
    public func validate(value: String) -> Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", PasswordRule.regex)
        return pattern.evaluate(with: value)
    }
    
    public func errorMessage() -> String {
        message
    }
    
}
