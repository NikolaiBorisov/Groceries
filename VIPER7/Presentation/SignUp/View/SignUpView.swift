//
//  SignUpView.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func didTapOnButton(withTitle: String)
}

final class SignUpView: UIView {
    
    public weak var delegate: SignUpViewDelegate?
    
    public lazy var titleLabel = UILabelFactory.generate(with: .greenGrocery, fontSize: 30)
    
    private lazy var nameControl = AccountTextControl()
    private lazy var emailControl = AccountTextControl()
    private lazy var passwordControl = AccountTextControl()
    
    private lazy var signUpButton = UIButtonFactory.generate(
        with: .signUp, fontSize: 25, backgroundColor: .systemGreen, titleColor: .white
    )
    
    public lazy var haveAccountLabel = UILabelFactory.generate(with: .haveAccount, fontSize: 25)
    
    private lazy var loginButton = UIButtonFactory.generate(
        with: .loginNow, fontSize: 25, backgroundColor: .white, titleColor: .systemGreen
    )
    
    private lazy var labelAndButtonStackView = UIStackViewFactory.generate(
        with: .horizontal, subviews: [haveAccountLabel, loginButton], spacing: 0
    )
    
    private lazy var mainStackView = UIStackViewFactory.generate(
        with: .vertical,
        subviews: [titleLabel, nameControl, emailControl, passwordControl, signUpButton, labelAndButtonStackView],
        spacing: 10
    )
    
    private lazy var statusLabel = UILabelFactory.generate(with: .none, fontSize: 30)
    
    // MARK: - Initializers
    
    init(delegate: SignUpViewDelegate) {
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
        case signUpButton: delegate?.didTapOnButton(withTitle: title)
        case loginButton: delegate?.didTapOnButton(withTitle: title)
        default: break
        }
    }
    
    // MARK: - Public Methods
    
    public func getFields() -> [FieldValidatable] {
        [nameControl, emailControl, passwordControl]
    }
    
    public func setErrorMessage() {
        nameControl.setErrorMessage()
        emailControl.setErrorMessage()
        passwordControl.setErrorMessage()
    }
    
    // MARK: - Private Methods
    
    private func addActionForButton() {
        [signUpButton, loginButton].forEach {
            $0.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        }
    }
    
    private func setupView() {
        backgroundColor = .white
        signUpButton.layer.cornerRadius = 5
    }
    
    private func setupAccountControl() {
        nameControl.configure(
            title: .name,
            validationRules: [RequiredRule()],
            contentType: .username,
            placeholder: .name
        )
        emailControl.configure(
            title: .email,
            validationRules: [RequiredRule(), EmailRule()],
            contentType: .emailAddress,
            placeholder: .email
        )
        passwordControl.configure(
            title: .password,
            validationRules: [RequiredRule(), PasswordRule()],
            contentType: .password,
            placeholder: .password
        )
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
        addSubview(statusLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
}
