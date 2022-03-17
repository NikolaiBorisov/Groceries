//
//  SignUpRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

protocol SignUpRouterProtocol: AnyObject {
    func routeToLogin()
}

final class SignUpRouter {
    
    // MARK: - Private Properties
    
    private var viewController: UIViewController
    private let switchLogin: () -> Void
    
    // MARK: - Initializers
    
    init(viewController: UIViewController, switchLogin: @escaping () -> Void) {
        self.viewController = viewController
        self.switchLogin = switchLogin
    }
    
}

// MARK: - SignUpRouterProtocol

extension SignUpRouter: SignUpRouterProtocol {
    
    func routeToLogin() {
        switchLogin()
    }
    
}
