//
//  UIView+Extension.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 04.02.2022.
//

import UIKit

// MARK: - CellIdentifier

/// Use class name for cellIdentifier. Return class name. Use it in Register cells
extension UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}

// MARK: - RoundView

extension UIView {
    
    func roundViewWith(cornerRadius: CGFloat = 0, borderColor: UIColor? = nil, borderWidth: CGFloat = 0) {
        self.layer.cornerCurve = .continuous
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
    }
    
}
