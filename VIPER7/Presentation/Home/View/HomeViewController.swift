//
//  HomeViewController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func loadCategories(categoriesList: [CategoryItemViewModel])
}

final class HomeViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var presenter: HomePresenterProtocol?
    
    // MARK: - Private Properties
    
    private lazy var mainView = CategoriesHomeView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.activityIndicator.startAnimating()
        presenter?.viewDidLoad()
    }
    
}

// MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol {
    
    func loadCategories(categoriesList: [CategoryItemViewModel]) {
        guard categoriesList.count > 0 else { return }
        mainView.categoryViews.enumerated().forEach { (index, categoryView) in
            categoryView.startAnimating()
            categoryView.configure(
                using: categoriesList[index]) { [weak self] imageName in
                    self?.presenter?.onFetchThumbnail(imageName: imageName, completion: { data in
                        guard let image = UIImage(data: data) else { return }
                        DispatchQueue.main.async {
                            categoryView.updateImage(image: image)
                            categoryView.stopAnimating()
                        }
                    })
                } categorySelectionHandler: { (categoryId, title) in
                    print("Category id = \(categoryId), title = \(title)")
                    self.presenter?.onCategorySelection(using: (id: categoryId, title: title))
                }
            
        }
        self.mainView.mainContainerStackView.isHidden = false
        mainView.activityIndicator.stopAnimating()
    }
    
}
