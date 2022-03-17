//
//  UILabelFactory.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

enum LabelText: String {
    case greenGrocery = "Green Grocery"
    case noAccount = "Don't Have an Account?"
    case haveAccount = "Already Have an Account?"
    case none = ""
}

final class UILabelFactory {
    
    static func generate(
        with text: LabelText,
        fontSize: CGFloat,
        alignment: NSTextAlignment = .center,
        textColor: UIColor = .systemGreen
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = alignment
        label.textColor = textColor
        label.text = text.rawValue
        label.font = .boldSystemFont(ofSize: fontSize)
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
}
