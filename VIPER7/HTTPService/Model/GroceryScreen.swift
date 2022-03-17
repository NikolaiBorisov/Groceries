//
//  GroceryScreen.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

enum GroceryScreen {
    case login
    case home
    case groceries
    case profile
    case cart
    
    var instance: UIViewController {
        switch self {
        case .login:
            return LoginViewController()
        case .home:
            return HomeViewController()
        case .groceries:
            return GroceriesListViewController()
        case .profile:
            return ProfileViewController()
        case .cart:
            return CartViewController()
        }
    }
    
}
