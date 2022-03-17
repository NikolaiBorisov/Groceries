//
//  EmailRule.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

final class EmailRule: Rule {
    
    // MARK: - Public Properties
    
    static let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    // MARK: - Private Properties
    
    private var message: String
    
    // MARK: - Initializers
    
    init(message: String = "Invalid Email") {
        self.message = message
    }
    
    // MARK: - Public Properties
    
    func validate(value: String) -> Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", EmailRule.regex)
        return pattern.evaluate(with: value)
    }
    
    func errorMessage() -> String {
        message
    }
    
}
