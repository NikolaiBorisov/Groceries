//
//  AccountTextControl.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

enum AccountLabelText: String {
    case email = "Email"
    case password = "Password"
    case name = "Name"
}

final class AccountTextControl: UIControl {
    
    // MARK: - Public Properties
    
    public var rules: [Rule] = []
    
    public lazy var inputTextField = UITextFieldFactory.generate(with: .none)
    
    // MARK: - Private Properties
    
    private lazy var titleLabel = UILabelFactory.generate(with: .none, fontSize: 16, alignment: .left)
    private lazy var errorLabel = UILabelFactory.generate(with: .none, fontSize: 16, alignment: .right, textColor: .systemRed)
    
    private lazy var labelStackView =  UIStackViewFactory.generate(
        with: .horizontal,
        subviews: [titleLabel, errorLabel],
        spacing: 0,
        distribution: .fillEqually
    )
    
    private lazy var mainStackView = UIStackViewFactory.generate(
        with: .vertical, subviews: [labelStackView, inputTextField], spacing: 10
    )
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func configure(
        title: AccountLabelText,
        validationRules: [Rule],
        contentType: UITextContentType,
        placeholder: Placeholder
    ) {
        titleLabel.text = title.rawValue
        inputTextField.textContentType = contentType
        inputTextField.isSecureTextEntry = (contentType == .password)
        inputTextField.placeholder = placeholder.rawValue
        setRules(rules: validationRules)
        inputTextField.delegate = self
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}

// MARK: - UITextFieldDelegate

extension AccountTextControl: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
    
}

// MARK: - FieldValidatable

extension AccountTextControl: FieldValidatable {
    
    var validationRules: [Rule] {
        get {
            return rules
        }
        set {
            rules = newValue
        }
    }
    
    var validationText: String {
        inputTextField.text ?? ""
    }
    
    func setRules(rules: [Rule]) {
        validationRules.removeAll()
        validationRules.append(contentsOf: rules)
    }
    
    func setErrorMessage() {
        errorLabel.text = rules
            .filter { !$0.validate(value: self.validationText) }
            .first
            .map { $0.errorMessage() }
    }
    
}
