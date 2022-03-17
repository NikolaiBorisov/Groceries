//
//  UITextFieldFactory.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

enum Placeholder: String {
    case name = "Enter your name..."
    case email = "Enter your email..."
    case password = "Enter your password..."
    case some = "Enter something..."
    case none = ""
}

final class UITextFieldFactory {
    
    static func generate(with placeholder: Placeholder) -> UITextField {
        let textField = UITextField()
        let insetView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftViewMode = .always
        textField.leftView = insetView
        textField.backgroundColor = .white
        textField.placeholder = placeholder.rawValue
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        return textField
    }
    
}
