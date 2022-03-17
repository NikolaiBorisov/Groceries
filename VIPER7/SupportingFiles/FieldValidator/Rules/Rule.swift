//
//  Rule.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

protocol Rule {
    func validate(value: String) -> Bool
    func errorMessage() -> String
}
