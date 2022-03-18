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
    func login(email: String, password: String)
}

final class LoginPresenter {
    
    typealias UseCases = (
        login: (
            _ email: String,
            _ password: String,
            _ completion: @escaping (AuthResult<String>) -> Void) -> Void,
        validate:  (
            _ token: String,
            _ completion: @escaping (AuthResult<User>) -> Void) -> Void
    )
    
    // MARK: - Public Properties
    
    public weak var view: LoginViewProtocol!
    
    // MARK: - Private Properties
    
    private var router: LoginRouterProtocol
    private let useCases: UseCases
    
    // MARK: - Initializers
    
    init(router: LoginRouterProtocol, useCases: UseCases) {
        self.router = router
        self.useCases = useCases
    }
    
}

// MARK: - LoginPresenterProtocol

extension LoginPresenter: LoginPresenterProtocol {
    
    func login(email: String, password: String) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.useCases.login(email, password) { [weak self] result in
                switch result {
                case .success(let token):
                    self?.useCases.validate(token) { result in
                        switch result {
                        case .success(_):
                            DispatchQueue.main.async {
                                self?.view.updateStatus(
                                    using: AuthStatusViewModel(title: "Login Successful!", color: .success)
                                )
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self?.router.routeToWindow()
                                }
                            }
                        case .failure(let error):
                            DispatchQueue.main.async {
                                self?.view.updateStatus(
                                    using: AuthStatusViewModel(title: error, color: .failure)
                                )
                            }
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("Login Error: \(error)")
                        self?.view.updateStatus(
                            using: AuthStatusViewModel(title: error, color: .failure)
                        )
                    }
                }
            }
            DispatchQueue.main.async {
                self.view.updateProgress(message: "Login", isCompleted: true)
            }
        }
    }
    
    func onSwitchSignUp() {
        router.routeToSignUp()
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
            view.updateProgress(message: "Logging In...", isCompleted: false)
        }
        completion(isValid)
    }
    
}
