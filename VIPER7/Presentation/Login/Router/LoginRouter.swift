//
//  LoginRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

protocol LoginRouterProtocol {
    func routeToSignUp()
}

final class LoginRouter {
    
    // MARK: - Private Properties
    
    private var viewController: UIViewController
    private let switchSignUp: () -> Void
    
    // MARK: - Initializers
    
    init(viewController: UIViewController, switchSignUp: @escaping () -> Void) {
        self.viewController = viewController
        self.switchSignUp = switchSignUp
    }
    
}

// MARK: - LoginRouterProtocol

extension LoginRouter: LoginRouterProtocol {
    
    func routeToSignUp() {
        switchSignUp()
    }
    
}
