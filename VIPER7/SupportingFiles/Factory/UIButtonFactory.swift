//
//  UIButtonFactory.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

enum ButtonTitle: String {
    case login = "Login"
    case signUp = " Sign Up"
    case loginNow = " Login Now"
}

final class UIButtonFactory {
    
    static func generate(
        with title: ButtonTitle,
        fontSize: CGFloat,
        backgroundColor: UIColor,
        titleColor: UIColor
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title.rawValue, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = .systemFont(ofSize: fontSize)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }
    
}
