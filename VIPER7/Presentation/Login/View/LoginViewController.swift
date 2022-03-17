//
//  LoginViewController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func updateInvalidFields()
    func updateProgress(isCompleted: Bool)
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
                if isValid {
                    
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
    
    func updateProgress(isCompleted: Bool) {
        mainView.updateProgress(isCompleted: isCompleted)
    }
    
    func updateInvalidFields() {
        mainView.setErrorMessage()
    }
    
}
