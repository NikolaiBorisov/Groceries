//
//  GroceriesListModuleBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 14.02.2022.
//

import UIKit

final class GroceriesListModuleBuilder {
    
    static func build(using category: (id: Int, title: String)) -> UIViewController {
        let vc = GroceriesListViewController()
        vc.title = category.title.uppercased()
        return vc
    }
    
}
