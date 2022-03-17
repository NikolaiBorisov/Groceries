//
//  AccountRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation
import UIKit

protocol AccountRouterProtocol {
    func showLogin()
    func showSignup()
}

final class AccountRouter {
    
    typealias Submodules = (
        loginModule: (_ switchSignUp: @escaping () -> Void) -> UIViewController,
        signUpModule: (_ switchLogin: @escaping () -> Void) -> UIViewController
    )
    
    // MARK: - Private Properties
    
    private let viewController: UIViewController
    private let submodules: Submodules
    private lazy var loginView = submodules.loginModule { [weak self] in
        self?.showSignup()
    }
    private lazy var signUpView = submodules.signUpModule { [weak self] in
        self?.showLogin()
    }
    
    // MARK: - Initializers
    
    init(viewController: UIViewController, submodules: Submodules) {
        self.viewController = viewController
        self.submodules = submodules
    }
    
}

// MARK: - AccountRouterProtocol

extension AccountRouter: AccountRouterProtocol {
    
    func showLogin() {
        remove(asChildVC: signUpView)
        add(asChildVC: loginView, direction: .transitionFlipFromLeft)
    }
    
    func showSignup() {
        remove(asChildVC: loginView)
        add(asChildVC: signUpView, direction: .transitionFlipFromRight)
    }
    
}

private extension AccountRouter {
    
    func add(asChildVC childController: UIViewController, direction: UIView.AnimationOptions) {
        viewController.addChild(childController)
        UIView.transition(
            with: viewController.view,
            duration: 0.3,
            options: direction,
            animations: { [viewController] in
                viewController.view.addSubview(childController.view)
            },
            completion: nil
        )
        childController.view.frame = viewController.view.bounds
        childController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childController.didMove(toParent: viewController)
    }
    
    func remove(asChildVC childController: UIViewController) {
        childController.willMove(toParent: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParent()
    }
    
}
