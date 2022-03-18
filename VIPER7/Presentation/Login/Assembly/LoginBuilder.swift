//
//  LoginBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

final class LoginBuilder {
    
    static func build(switchSignUp: @escaping () -> Void, onLogin: @escaping () -> Void) -> UIViewController {
        let vc = LoginViewController()
        let router = LoginRouter(
            viewController: vc,
            switchSignUp: switchSignUp,
            onLogin: onLogin
        )
        let authInteractor = AuthInteractor.shared
        let presenter = LoginPresenter(
            router: router,
            useCases: (
                login: authInteractor.login,
                validate: authInteractor.validate)
        )
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
}
