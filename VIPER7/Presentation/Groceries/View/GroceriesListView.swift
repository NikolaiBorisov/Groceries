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
    
    public lazy var groceriesTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.register(cell: GroceryItemCell.self)
        $0.contentInsetAdjustmentBehavior = .never
        $0.separatorColor = .systemGreen
        $0.backgroundColor = .white
        $0.estimatedRowHeight = 120
        $0.rowHeight = UITableView.automaticDimension
        return $0
    }(UITableView())
    
    public lazy var categoryImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "groceries")
        return $0
    }(UIImageView())
    
    public lazy var coverDescriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .left
        $0.textColor = .white
        $0.text = "Text!"
        return $0
    }(UILabel())
    
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
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(categoryImageView)
        categoryImageView.addSubview(coverDescriptionLabel)
        addSubview(groceriesTableView)
    }
    
    private func setupLayout() {
        coverHeightConstraint = categoryImageView.heightAnchor.constraint(equalToConstant: 200)
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
            groceriesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}
