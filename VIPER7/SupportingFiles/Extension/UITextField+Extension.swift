//
//  UITextField+Extension.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import UIKit

extension UITextField {
    
    func placeholderColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "...",
            attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}
