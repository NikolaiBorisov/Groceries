//
//  UILabelInset.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 11.02.2022.
//

import UIKit

final class InsetLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(
            top: 0,
            left: 5,
            bottom: 0,
            right: 5))
        )
    }
    
}
