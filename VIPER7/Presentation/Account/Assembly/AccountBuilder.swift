//
//  AccountBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

final class AccountBuilder {
    
    static func build() -> UIViewController {
        let accountView = AccountViewController()
        let router = AccountRouter(
            viewController: accountView,
            submodules: (
                loginModule: LoginBuilder.build,
                signUpModule: SignUpBuilder.build
            )
        )
        let presenter = AccountPresenter(router: router)
        accountView.presenter = presenter
        presenter.view = accountView
        return accountView
    }
    
}
