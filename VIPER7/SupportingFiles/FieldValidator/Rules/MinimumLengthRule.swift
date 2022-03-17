//
//  MinimumLengthRule.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

final class MinimumLengthRule: Rule {
    
    // MARK: - Public Properties
    
    public let MIN_LENGTH = 3
    
    // MARK: - Private Properties
    
    private var message: String
    
    // MARK: - Initializers
    
    init(message: String) {
        self.message = message
    }
    
    // MARK: - Public Methods
    
    public func validate(value: String) -> Bool {
        value.count > 3
    }
    
    public func errorMessage() -> String {
        message
    }
    
}
