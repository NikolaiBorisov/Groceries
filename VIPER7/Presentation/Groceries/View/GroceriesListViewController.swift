//
//  GroceriesListViewController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 14.02.2022.
//

import UIKit

protocol GroceriesListViewProtocol: AnyObject {
    func updateGroceries(groceriesList: [GroceryItemViewModel])
    func updateCoverImage(data: Data)
    func updateCoverTitle(detailes: String)
}

final class GroceriesListViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var presenter: GroceriesListPresenterProtocol?
    
    // MARK: - Private Properties
    
    private lazy var mainView = GroceriesListView()
    private var previousOffsetState: CGFloat = 0
    private var largeNavigationBarHeight: CGFloat = 50
    
    private var dataSource: [GroceryItemViewModel] = [] {
        didSet {
            mainView.groceriesTableView.reloadData()
        }
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        mainView.groceriesTableView.dataSource = self
        mainView.groceriesTableView.delegate = self
    }
    
}

// MARK: - GroceriesListViewProtocol

extension GroceriesListViewController: GroceriesListViewProtocol {
    
    func updateCoverImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        mainView.categoryImageView.image = image
    }
    
    func updateCoverTitle(detailes: String) {
        mainView.coverDescriptionLabel.text = detailes
    }
    
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        dataSource = groceriesList
    }
    
}

// MARK: - UITableViewDataSource

extension GroceriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10 // dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let viewModel = dataSource[indexPath.row]
        let cell: GroceryItemCell = tableView.dequeueCell(for: indexPath)
        
//        cell.configure(using: viewModel) { result in
//            print("Cart Item added with sku = \(result.skuId) and quantity = \(result.stepValue)")
//            let skuItem: SkuItem = (skuId: result.skuId, quantity: result.stepValue)
//            self.presenter?.onAddToCart(skuItem: skuItem)
//        }

//        self.presenter.onFetchThumbnail(imageName: viewModel.image) { data in
//            guard let image = UIImage(data: data) else { return }
//            DispatchQueue.main.async {
//                cell.updateProductImage(image: image)
//            }
//        }
        cell.delegate = self
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension GroceriesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > (200 + largeNavigationBarHeight) {
            mainView.coverHeightConstraint.constant = 0
        }
        
        let offsetDiff = previousOffsetState - scrollView.contentOffset.y
        print("Current offset: \(scrollView.contentOffset.y)")
        print("Previous offset: \(previousOffsetState)")
        print("Offset difference: \(offsetDiff)")
        previousOffsetState = scrollView.contentOffset.y
        let newConstraintHeight = mainView.coverHeightConstraint.constant + offsetDiff
        mainView.coverHeightConstraint.constant = newConstraintHeight
    }
    
}

// MARK: - GroceryItemCellDelegate

extension GroceriesListViewController: GroceryItemCellDelegate {
    
    func onPlusButtonTapped() {
        
    }
    
    func onMinusButtonTapped() {
        
    }
    
    func onAddButtonTapped() {
        
    }
    
}
