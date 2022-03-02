//
//  CategoryView.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 11.02.2022.
//

import UIKit

typealias CategorySelectionHandler = (_ categoryId: Int, _ title: String) -> Void

final class CategoryView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var activityIndicator = ActivityIndicatorView(color: .systemGreen, style: .medium)
    private var viewModel: CategoryItemViewModel?
    private var handler: CategorySelectionHandler?
    
    private var backgroundImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.backgroundColor = .white
        return $0
    }(UIImageView())
    
    private lazy var groceryButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))
    
    private lazy var titleLabel: InsetLabel = {
        $0.textAlignment = .left
        $0.text = ""
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(InsetLabel())
    
    private lazy var subtitleLabel: InsetLabel = {
        $0.textAlignment = .left
        $0.text = ""
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .lightGray
        $0.numberOfLines = 1
        return $0
    }(InsetLabel())
    
    private lazy var labelStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.backgroundColor = .darkGray.withAlphaComponent(0.8)
        $0.spacing = 5
        return $0
    }(UIStackView(arrangedSubviews: [titleLabel, subtitleLabel]))
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupLayout()
        setupView()
        addActionForButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func onCategoryTapped() {
        guard let categoryId = viewModel?.id,
              let title = viewModel?.title else { return }
        handler?(categoryId, title)
    }
    
    // MARK: - Private Methods
    
    private func addActionForButton() {
        groceryButton.addTarget(self, action: #selector(onCategoryTapped), for: .touchUpInside)
    }
    
    // MARK: - Public Methods
    
    public func configure(
        using viewModel: CategoryItemViewModel,
        onComplete: (_ imageName: String) -> (),
        categorySelectionHandler: @escaping CategorySelectionHandler
    ) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title.uppercased()
        subtitleLabel.text = viewModel.details
        onComplete(viewModel.imageName)
        self.handler = categorySelectionHandler
    }
    
    public func updateImage(image: UIImage) {
        backgroundImageView.image = image
    }
    
    public func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    public func stopAnimating() {
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .systemBlue
        backgroundImageView.layer.cornerRadius = 10
        labelStackView.layer.cornerRadius = 10
    }
    
    private func addSubviews() {
        addSubview(backgroundImageView)
        addSubview(groceryButton)
        backgroundImageView.addSubview(labelStackView)
        backgroundImageView.addSubview(activityIndicator)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            labelStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            groceryButton.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            groceryButton.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            groceryButton.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),
            groceryButton.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor)
        ])
    }
    
}
