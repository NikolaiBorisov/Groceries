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
    
    private lazy var imageContainerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private var itemImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    // MARK: - titleAndDetailsLabelStackView
    
    private lazy var activityIndicator = ActivityIndicatorView(color: .systemGreen, style: .medium)
    
    private let titleLabel: UILabel = {
        $0.textAlignment = .left
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private let detailsLabel: UILabel = {
        $0.textAlignment = .left
        $0.textColor = .black
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var titleAndDetailsLabelStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 10
        return $0
    }(UIStackView(arrangedSubviews: [titleLabel, detailsLabel]))
    
    // MARK: - addToBagContainer
    
    private lazy var addToBagContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
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
        activityIndicator.startAnimating()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        itemImageView.layer.cornerRadius = itemImageView.frame.height / 2
    }
    
    // MARK: - Public Methods
    
    public func configure(using viewModel: GroceryItemViewModel) {
        titleLabel.text = viewModel.title.capitalized
        detailsLabel.text = viewModel.details
        selectionStyle = .none
    }
    
    public func updateGroceryIcon(image: UIImage) {
        itemImageView.image = image
    }
    
    public func stopAnimating() {
        activityIndicator.stopAnimating()
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
        contentView.addSubview(imageContainerView)
        contentView.addSubview(titleAndDetailsLabelStackView)
        imageContainerView.addSubview(itemImageView)
        itemImageView.addSubview(activityIndicator)
        // addToBagContainer.addSubview(addToBagControl)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageContainerView.widthAnchor.constraint(equalToConstant: 100),
            imageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            itemImageView.widthAnchor.constraint(equalToConstant: 50),
            itemImageView.heightAnchor.constraint(equalToConstant: 50),
            itemImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            itemImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            
            titleAndDetailsLabelStackView.leadingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: 10),
            titleAndDetailsLabelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleAndDetailsLabelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleAndDetailsLabelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            activityIndicator.centerXAnchor.constraint(equalTo: itemImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: itemImageView.centerYAnchor)
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
