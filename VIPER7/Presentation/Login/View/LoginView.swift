//
//  LoginView.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapOnButton(withTitle: String)
}

final class LoginView: UIView {
    
    // MARK: - Public Properties
    
    public weak var delegate: LoginViewDelegate?
    
    public var emailAccountText: String {
        emailAccountControl.validationText
    }
    
    public var passwordAccountText: String {
        passwordAccountControl.validationText
    }
    
    // MARK: - Private Properties
    
    private lazy var titleLabel = UILabelFactory.generate(with: .greenGrocery, fontSize: 30)
    
    private lazy var emailAccountControl = AccountTextControl()
    private lazy var passwordAccountControl = AccountTextControl()
    
    private lazy var loginButton = UIButtonFactory.generate(
        with: .login, fontSize: 30, backgroundColor: .systemGreen, titleColor: .white
    )
    
    private lazy var noAccountLabel = UILabelFactory.generate(with: .noAccount, fontSize: 25)
    
    private lazy var signUpButton = UIButtonFactory.generate(
        with: .signUp, fontSize: 25, backgroundColor: .white, titleColor: .systemGreen
    )
    
    private lazy var labelAndButtonStackView = UIStackViewFactory.generate(
        with: .horizontal, subviews: [noAccountLabel, signUpButton], spacing: 0
    )
    
    private lazy var middleStackView = UIStackViewFactory.generate(
        with: .vertical,
        subviews: [emailAccountControl, passwordAccountControl, loginButton, labelAndButtonStackView],
        spacing: 20
    )
    
    private lazy var statusLabel = UILabelFactory.generate(with: .none, fontSize: 30)
    
    // MARK: - Initializers
    
    init(delegate: LoginViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        
        addSubviews()
        setupLayout()
        setupView()
        addActionForButton()
        setupAccountControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func buttonWasTapped(sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        switch sender {
        case loginButton: delegate?.didTapOnButton(withTitle: title)
        case signUpButton: delegate?.didTapOnButton(withTitle: title)
        default: break
        }
    }
    
    // MARK: - Public Methods
    
    public func getFields() -> [FieldValidatable] {
        [emailAccountControl, passwordAccountControl]
    }
    
    public func setErrorMessage() {
        emailAccountControl.setErrorMessage()
        passwordAccountControl.setErrorMessage()
    }
    
    public func updateProgress(message: String, isCompleted: Bool) {
        loginButton.isEnabled = isCompleted
        loginButton.setTitle(message, for: .normal)
        if isCompleted {
            emailAccountControl.inputTextField.text = ""
            passwordAccountControl.inputTextField.text = ""
        }
    }
    
    public func setStatusLabel(using viewModel: AuthStatusViewModel) {
        statusLabel.text = viewModel.title
        statusLabel.textColor = UIColor(hex: viewModel.color.rawValue)
    }
    
    // MARK: - Private Methods
    
    private func addActionForButton() {
        [loginButton, signUpButton].forEach {
            $0.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        }
    }
    
    private func setupView() {
        backgroundColor = .white
        loginButton.layer.cornerRadius = 5
    }
    
    private func setupAccountControl() {
        emailAccountControl.configure(
            title: .email,
            validationRules: [RequiredRule(), EmailRule()],
            contentType: .emailAddress,
            placeholder: .email
        )
        passwordAccountControl.configure(
            title: .password,
            validationRules: [RequiredRule(), PasswordRule()],
            contentType: .password,
            placeholder: .password
        )
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(middleStackView)
        addSubview(statusLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            middleStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            middleStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            middleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
}
