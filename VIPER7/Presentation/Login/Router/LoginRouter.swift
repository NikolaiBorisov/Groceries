//
//  LoginRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

protocol LoginRouterProtocol {
    func routeToSignUp()
    func routeToWindow()
}

final class LoginRouter {
    
    // MARK: - Private Properties
    
    private var viewController: UIViewController
    private let switchSignUp: () -> Void
    private let onLogin: () -> Void
    
    // MARK: - Initializers
    
    init(
        viewController: UIViewController,
        switchSignUp: @escaping () -> Void,
        onLogin: @escaping () -> Void
    ) {
        self.viewController = viewController
        self.switchSignUp = switchSignUp
        self.onLogin = onLogin
    }
    
}

// MARK: - LoginRouterProtocol

extension LoginRouter: LoginRouterProtocol {
    
    func routeToWindow() {
        onLogin()
    }
    
    func routeToSignUp() {
        switchSignUp()
    }
    
}
