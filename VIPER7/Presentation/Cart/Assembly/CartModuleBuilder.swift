//
//  CartModuleBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import UIKit

final class CartModuleBuilder {
    
    static func build(using navigationFactory: NavigationFactory) -> UIViewController {
        let vc = CartViewController()
        vc.title = "Cart"
        return navigationFactory(vc)
    }
    
}
