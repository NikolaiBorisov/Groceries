//
//  LoginBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

final class LoginBuilder {
    
    static func build(switchSignUp: @escaping () -> Void) -> UIViewController {
        let vc = LoginViewController()
        let router = LoginRouter(viewController: vc, switchSignUp: switchSignUp)
        let presenter = LoginPresenter(router: router)
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
}
