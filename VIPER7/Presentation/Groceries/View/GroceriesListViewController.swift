//
//  GroceriesListViewController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 14.02.2022.
//

import UIKit

protocol GroceriesListViewProtocol: AnyObject {
    func updateGroceries(groceriesList: [GroceryItemViewModel])
    func updateCoverImage(imageData: Data)
    func updateCoverTitle(title: String)
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
    
    func updateCoverTitle(title: String) {
        mainView.coverDescriptionLabel.text = title
    }
    
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        dataSource = groceriesList
    }
    
    func updateCoverImage(imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        mainView.categoryImageView.image = image
        mainView.stopAnimating()
    }
    
}

// MARK: - UITableViewDataSource

extension GroceriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath.row]
        let cell: GroceryItemCell = tableView.dequeueCell(for: indexPath)
        cell.configure(using: viewModel)
        self.presenter?.onThumbnailUpdate(imageName: viewModel.image) { data in
            DispatchQueue.main.async {
                guard let data = data,
                      let image = UIImage(data: data) else { return }
                cell.updateGroceryIcon(image: image)
                cell.stopAnimating()
            }
        }
        cell.delegate = self
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension GroceriesListViewController: UITableViewDelegate {
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > (mainView.categoryImageViewHeight + largeNavigationBarHeight) {
//            mainView.coverHeightConstraint.constant = 0
//        }
//        let offsetDiff = previousOffsetState - scrollView.contentOffset.y
//        previousOffsetState = scrollView.contentOffset.y
//        let newConstraintHeight = mainView.coverHeightConstraint.constant + offsetDiff
//        mainView.coverHeightConstraint.constant = newConstraintHeight
//    }
    
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
