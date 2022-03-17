//
//  FieldValidatable.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

protocol FieldValidatable {
    var validationRules: [Rule] { get }
    var validationText: String { get }
}
