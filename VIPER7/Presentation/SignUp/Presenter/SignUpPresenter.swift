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
    func signUp(userName: String, email: String, password: String)
}

final class SignUpPresenter {
    
    typealias UseCases = (
        signUp: (
            _ userName: String,
            _ email: String,
            _ password: String,
            _ completion: @escaping (AuthResult<String>) -> Void) -> Void,
        ()
    )
    
    // MARK: - Public Properties
    
    public weak var view: SignUpViewProtocol!
    
    // MARK: - Private Properties
    
    private var router: SignUpRouterProtocol
    private let useCases: UseCases
    
    // MARK: - Initializers
    
    init(router: SignUpRouterProtocol, useCases: UseCases) {
        self.router = router
        self.useCases = useCases
    }
    
    
}

// MARK: - SignUpPresenterProtocol

extension SignUpPresenter: SignUpPresenterProtocol {
    
    func signUp(userName: String, email: String, password: String) {
        useCases.signUp(userName, email, password) { result in
            switch result {
            case .success(let message):
                self.view.updateStatus(using: AuthStatusViewModel(title: message, color: .success))
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    self?.router.routeToLogin()
                }
                break
            case .failure(let error):
                self.view.updateStatus(using: AuthStatusViewModel(title: error, color: .failure))
                break
            }
            self.view.updateProgress(isCompleted: true)
        }
    }
    
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
            view.updateProgress(isCompleted: false)
        }
        completion(isValid)
    }
    
}
