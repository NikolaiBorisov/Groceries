//
//  AccountBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

final class AccountBuilder {
    
    static func build(onLogin: @escaping () -> Void) -> UIViewController {
        let accountView = AccountViewController()
        let router = AccountRouter(
            viewController: accountView,
            submodules: (
                loginModule: LoginBuilder.build,
                signUpModule: SignUpBuilder.build
            ), onLogin: onLogin
        )
        let presenter = AccountPresenter(router: router)
        accountView.presenter = presenter
        presenter.view = accountView
        return accountView
    }
    
}
