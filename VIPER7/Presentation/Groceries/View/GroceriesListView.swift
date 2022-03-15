//
//  GroceriesListView.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 14.02.2022.
//

import UIKit

final class GroceriesListView: UIView {
    
    // MARK: - Public Properties
    
    public var coverHeightConstraint = NSLayoutConstraint()
    public var categoryImageViewHeight: CGFloat = 200
    
    public lazy var groceriesTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.register(cell: GroceryItemCell.self)
        $0.contentInsetAdjustmentBehavior = .never
        $0.separatorColor = .systemGreen
        $0.backgroundColor = .white
        $0.rowHeight = UITableView.automaticDimension
        $0.autoresizesSubviews = true
        return $0
    }(UITableView())
    
    public lazy var categoryImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    public lazy var coverDescriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.clipsToBounds = true
        $0.backgroundColor = .darkGray.withAlphaComponent(0.8)
        return $0
    }(UILabel())
    
    // MARK: - Private Properties
    
    private lazy var activityIndicator = ActivityIndicatorView(color: .systemGreen, style: .medium)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        addSubviews()
        setupLayout()
        activityIndicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func stopAnimating() {
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .white
        coverDescriptionLabel.layer.cornerRadius = 5
    }
    
    private func addSubviews() {
        addSubview(categoryImageView)
        categoryImageView.addSubview(coverDescriptionLabel)
        categoryImageView.addSubview(activityIndicator)
        addSubview(groceriesTableView)
    }
    
    private func setupLayout() {
        coverHeightConstraint = categoryImageView.heightAnchor.constraint(equalToConstant: categoryImageViewHeight)
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverHeightConstraint,
            
            coverDescriptionLabel.bottomAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: -10),
            coverDescriptionLabel.leadingAnchor.constraint(equalTo: categoryImageView.leadingAnchor, constant: 10),
            coverDescriptionLabel.trailingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: -10),
            
            groceriesTableView.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 10),
            groceriesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            groceriesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            groceriesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: categoryImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor)
        ])
    }
    
}
