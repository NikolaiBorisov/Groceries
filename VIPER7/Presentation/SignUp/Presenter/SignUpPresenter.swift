//
//  SignUpPresenter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

protocol SignUpPresenterProtocol: AnyObject {
    func onSwitchLogin()
    func validate(using fields: [FieldValidatable], completion: (Bool) -> ())
}

final class SignUpPresenter {
    
    // MARK: - Public Properties
    
    public weak var view: SignUpViewProtocol!
    
    // MARK: - Private Properties
    
    private var router: SignUpRouterProtocol
    
    // MARK: - Initializers
    
    init(router: SignUpRouterProtocol) {
        self.router = router
    }
    
    
}

// MARK: - SignUpPresenterProtocol

extension SignUpPresenter: SignUpPresenterProtocol {
    
    func onSwitchLogin() {
        router.routeToLogin()
    }
    
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
    
}
