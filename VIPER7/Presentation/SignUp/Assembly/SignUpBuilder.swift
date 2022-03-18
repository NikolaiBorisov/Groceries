//
//  SignUpBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

final class SignUpBuilder {
    
    static func build(switchLogin: @escaping () -> Void) -> UIViewController {
        let vc = SignUpViewController()
        let router = SignUpRouter(viewController: vc, switchLogin: switchLogin)
        let authInteractor = AuthInteractor.shared
        let presenter = SignUpPresenter(
            router: router,
            useCases: (signUp: authInteractor.signUp, ())
        )
        vc.presenter = presenter
        presenter.view = vc
        return vc
    }
    
}
