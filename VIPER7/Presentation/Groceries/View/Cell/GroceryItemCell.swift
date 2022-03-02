//
//  GroceryItemCell.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 04.02.2022.
//

import UIKit

protocol GroceryItemCellDelegate: AnyObject {
    func onAddButtonTapped()
    func onPlusButtonTapped()
    func onMinusButtonTapped()
}

final class GroceryItemCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    public weak var delegate: GroceryItemCellDelegate?
    
    // MARK: - Private Properties
    
    private var itemImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    // MARK: - titleAndDetailsLabelStackView
    
    private let titleLabel: UILabel = {
        $0.textAlignment = .left
        $0.textColor = .black
        $0.text = "Title"
        return $0
    }(UILabel())
    
    private let detailsLabel: UILabel = {
        $0.textAlignment = .left
        $0.textColor = .black
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        $0.text = "Title"
        return $0
    }(UILabel())
    
    private lazy var titleAndDetailsLabelStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [titleLabel, detailsLabel]))
    
    // MARK: - priceAndAddToBagStackView
    
    private let priceLabel: UILabel = {
        $0.textAlignment = .left
        $0.textColor = .black
        $0.text = "Title"
        return $0
    }(UILabel())
    
    private lazy var addToBagContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private lazy var priceAndAddToBagStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [priceLabel, addToBagContainer]))
    
    // MARK: - mainStackView
    
    private lazy var mainStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [titleAndDetailsLabelStackView, priceAndAddToBagStackView]))
    
    // MARK: - AddToBagControlView
    
    private lazy var addToBagControl: AddToBagControlView = {
        return $0
    }(AddToBagControlView())
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        addSubviews()
        setupLayout()
        setupDelegate()
        setupAddToBagLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Public Methods
    
    public func configure(
        using viewModel: GroceryItemViewModel,
        addToCartClosure: @escaping BagClosure
    ) {
        titleLabel.text = viewModel.title
        detailsLabel.text = viewModel.details
        priceLabel.text = viewModel.price
        itemImageView.image = UIImage(named: viewModel.image)
        addToBagControl.configure(using: viewModel.cartValue, bagClosure: addToCartClosure)
        selectionStyle = .none
    }
    
    // MARK: - Private Methods
    
    private func setupDelegate() {
        addToBagControl.delegate = self
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        addToBagContainer.roundViewWith(cornerRadius: 10, borderColor: .systemGreen, borderWidth: 2)
    }
    
    private func addSubviews() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleAndDetailsLabelStackView)
        contentView.addSubview(mainStackView)
        addToBagContainer.addSubview(addToBagControl)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            itemImageView.widthAnchor.constraint(equalToConstant: 120),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            mainStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupAddToBagLayout() {
        addToBagControl.setupAddToBagControl(on: addToBagContainer)
    }
    
}

// MARK: - AddToBagControlDelegate

extension GroceryItemCell: AddToBagControlDelegate {
    
    func onPlusButtonTapped() { delegate?.onPlusButtonTapped() }
    func onMinusButtonTapped() { delegate?.onMinusButtonTapped() }
    func onAddButtonTapped() { delegate?.onAddButtonTapped() }
    
}
