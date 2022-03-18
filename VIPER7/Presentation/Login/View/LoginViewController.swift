//
//  LoginViewController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func updateInvalidFields()
    func updateProgress(message: String, isCompleted: Bool)
    func updateStatus(using viewModel: AuthStatusViewModel)
}

final class LoginViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var presenter: LoginPresenterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var mainView = LoginView(delegate: self)
    
    // MARK: - Life Cycle
    
    override func loadView() {
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    
    func didTapOnButton(withTitle: String) {
        switch withTitle {
        case ButtonTitle.login.rawValue:
            presenter.validate(using: mainView.getFields()) { isValid in
                /// If client validation is completed, let's do the login process
                if isValid {
                    presenter.login(
                        email: mainView.emailAccountText,
                        password: mainView.passwordAccountText
                    )
                }
            }
        case ButtonTitle.signUp.rawValue:
            presenter.onSwitchSignUp()
        default: break
        }
    }
    
}

// MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    
    func updateStatus(using viewModel: AuthStatusViewModel) {
        mainView.setStatusLabel(using: viewModel)
    }
    
    func updateProgress(message: String, isCompleted: Bool) {
        mainView.updateProgress(message: message, isCompleted: isCompleted)
    }
    
    func updateInvalidFields() {
        mainView.setErrorMessage()
    }
    
}
