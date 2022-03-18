//
//  UIColor+Extension.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat? = nil) {
        var hex: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        
        var a: UInt64
        let r, g, b: UInt64
        switch hex.count {
            // RGB (12-bit)
        case 3:
            (a, r, g, b) = (255, (rgb >> 8) * 17, (rgb >> 4 & 0xF) * 17, (rgb & 0xF) * 17)
            // RGB (24-bit)
        case 6:
            (a, r, g, b) = (255, rgb >> 16, rgb >> 8 & 0xFF, rgb & 0xFF)
            // ARGB (32-bit)
        case 8:
            (a, r, g, b) = (rgb >> 24, rgb >> 16 & 0xFF, rgb >> 8 & 0xFF, rgb & 0xFF)
            // gray as like systemGray
        default:
            (a, r, g, b) = (255, 123, 123, 129)
        }
        
        if let alpha = alpha, alpha >= 0, alpha <= 1  {
            a = UInt64(alpha * 255)
        }
        
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
    
    //MARK: - Methods
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
    
    
    
    func lighter(by percentage: CGFloat) -> UIColor? {
        self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat) -> UIColor? {
        self.adjust(by: -1 * abs(percentage) )
    }
    
    private func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(
                red: min(red + percentage / 100, 1.0),
                green: min(green + percentage / 100, 1.0),
                blue: min(blue + percentage / 100, 1.0),
                alpha: alpha
            )
        } else {
            return nil
        }
    }
    
}
