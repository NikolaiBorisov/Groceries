//
//  SignUpViewController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

protocol SignUpViewProtocol: AnyObject {
    func updateInvalidFields()
    func updateProgress(isCompleted: Bool)
    func updateStatus(using viewModel: AuthStatusViewModel)
}

final class SignUpViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var presenter: SignUpPresenterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var mainView = SignUpView(delegate: self)
    
    // MARK: - Life Cycle
    
    override func loadView() {
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

// MARK: - SignUpViewDelegate

extension SignUpViewController: SignUpViewDelegate {
    
    func didTapOnButton(withTitle: String) {
        switch withTitle {
        case ButtonTitle.signUp.rawValue:
            presenter.validate(using: mainView.getFields()) { isValid in
                if isValid {
                    presenter.signUp(
                        userName: mainView.nameControlText,
                        email: mainView.emailControlText,
                        password: mainView.passwordControlText
                    )
                }
            }
        case ButtonTitle.loginNow.rawValue:
            presenter.onSwitchLogin()
        default: break
        }
    }
    
}

// MARK: - SignUpViewProtocol

extension SignUpViewController: SignUpViewProtocol {
    
    func updateStatus(using viewModel: AuthStatusViewModel) {
        mainView.setStatusLabel(using: viewModel)
    }
    
    func updateInvalidFields() {
        mainView.setErrorMessage()
    }
    
    func updateProgress(isCompleted: Bool) {
        mainView.setSignUpButtonTitle(isCompleted: isCompleted)
    }
    
}
