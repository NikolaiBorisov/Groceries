//
//  CategoriesHomeView.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 11.02.2022.
//

import UIKit

final class CategoriesHomeView: UIView {
    
    // MARK: - Public Properties
    
    public lazy var activityIndicator = ActivityIndicatorView(color: .systemGreen, style: .medium)
    
    public lazy var categoryViews: [CategoryView] = [
        topContainerView,
        bottomLeftTopContainerView,
        bottomLeftBottomContainerView,
        bottomRightContainerView
    ]
    
    // MARK: - Private Properties
    
    private lazy var topContainerView: CategoryView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(CategoryView())
    
    // MARK: - bottomLeftContainerStackView
    
    private lazy var bottomLeftTopContainerView: CategoryView = {
        $0.backgroundColor = .white
        return $0
    }(CategoryView())
    
    private lazy var bottomLeftBottomContainerView: CategoryView = {
        $0.backgroundColor = .white
        return $0
    }(CategoryView())
    
    private lazy var bottomLeftContainerStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [bottomLeftTopContainerView, bottomLeftBottomContainerView]))
    
    // MARK: - bottomRightContainerView
    
    private lazy var bottomRightContainerView: CategoryView = {
        $0.backgroundColor = .white
        return $0
    }(CategoryView())
    
    // MARK: - bottomContainerStackView
    
    private lazy var bottomContainerStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [bottomLeftContainerStackView, bottomRightContainerView]))
    
    // MARK: - mainContainerStackView
    
    public lazy var mainContainerStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        $0.isHidden = true
        return $0
    }(UIStackView(arrangedSubviews: [topContainerView, bottomContainerStackView]))
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupLayout()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .white
        categoryViews.forEach { $0.layer.cornerRadius = 10 }
    }
    
    private func addSubviews() {
        addSubview(activityIndicator)
        addSubview(mainContainerStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainContainerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainContainerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainContainerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainContainerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
