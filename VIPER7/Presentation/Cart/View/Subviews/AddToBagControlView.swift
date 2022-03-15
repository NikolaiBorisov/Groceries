//
//  AddToBagControlView.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import UIKit

typealias BagClosure = ((skuId: String, stepValue: Int)) -> ()

protocol AddToBagControlDelegate: AnyObject {
    func onAddButtonTapped()
    func onPlusButtonTapped()
    func onMinusButtonTapped()
}

final class AddToBagControlView: UIView {
    
    // MARK: - Public Properties
    
    public var closure: BagClosure?
    public weak var delegate: AddToBagControlDelegate?
    
    // MARK: - Private Properties
    
    private var viewModel: CartValueViewModel! {
        didSet {
            let isHidden = viewModel.showStepper
            addButton.isHidden = isHidden
            mainStackView.isHidden = !isHidden
            stepLabel.text = "\(viewModel.stepValue)"
        }
    }
    
    private lazy var addButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGreen
        $0.setTitle("ADD TO BAG", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 6)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        return $0
    }(UIButton(type: .system))
    
    private lazy var stepLabel: UILabel = {
        $0.textAlignment = .center
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var plusButton: UIButton = {
        $0.backgroundColor = .systemBlue
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 25)
        return $0
    }(UIButton(type: .system))
    
    private lazy var minusButton: UIButton = {
        $0.backgroundColor = .systemPink
        $0.setTitle("-", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 25)
        return $0
    }(UIButton(type: .system))
    
    private lazy var mainStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 5
        return $0
    }(UIStackView(arrangedSubviews: [minusButton, stepLabel, plusButton]))
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtonAction()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func onButtonTapped(sender: UIButton) {
        switch sender {
        case addButton:
            viewModel = viewModel.onAddToBag()
            closure?((viewModel.id, viewModel.stepValue))
            delegate?.onAddButtonTapped()
        case plusButton:
            viewModel = viewModel.onIncrement()
            closure?((viewModel.id, viewModel.stepValue))
            delegate?.onPlusButtonTapped()
        case minusButton:
            viewModel = viewModel.onDecrement()
            closure?((viewModel.id, viewModel.stepValue))
            delegate?.onMinusButtonTapped()
        default: break
        }
    }
    
    // MARK: - Public Methods
    
    public func configure(using viewModel: CartValueViewModel, bagClosure: @escaping BagClosure) {
        self.viewModel = viewModel
        addButton.setTitle(viewModel.title, for: .normal)
        closure = bagClosure
    }
    
    public func setupAddToBagControl(on view: UIView) {
        view.addSubview(addButton)
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addButton.topAnchor.constraint(equalTo: view.topAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Private Methods
    
    private func setupButtonAction() {
        [addButton, plusButton, minusButton].forEach {
            $0.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setupView() {
        [addButton, plusButton].forEach {
            $0.roundViewWith(cornerRadius: 10, borderColor: .systemGreen, borderWidth: 2)
        }
        minusButton.roundViewWith(cornerRadius: 10, borderColor: .systemPink, borderWidth: 2)
    }
    
}
