//
//  LoginPresenter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

protocol LoginPresenterProtocol {
    func onSwitchSignUp()
    func validate(using fields: [FieldValidatable], completion: (Bool) -> ())
}

final class LoginPresenter {
    
    // MARK: - Public Properties
    
    public weak var view: LoginViewProtocol!
    
    // MARK: - Private Properties
    
    private var router: LoginRouterProtocol
    
    // MARK: - Initializers
    
    init(router: LoginRouterProtocol) {
        self.router = router
    }
    
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    
    func validate(using fields: [FieldValidatable], completion: (Bool) -> ()) {
        var isValid = true
        fields.forEach { field in
            field.validationRules.forEach { rule in
                if !rule.validate(value: field.validationText) {
                    isValid = false
                    return 
                }
            }
        }
        view.updateInvalidFields()
        if isValid {
            // 
        }
    }
    
    func onSwitchSignUp() {
        router.routeToSignUp()
    }
    
}
