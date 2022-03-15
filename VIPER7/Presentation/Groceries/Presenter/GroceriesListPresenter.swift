//
//  GroceriesListPresenter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 14.02.2022.
//

import Foundation
import UIKit

protocol GroceriesListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func onThumbnailUpdate(imageName: String, completion: @escaping ImageClosure)
}

final class GroceriesListPresenter {
    
    // MARK: - Public Properties
    
    public var categoryId: Int
    public var router: GroceriesListRouter
    public var useCase: UseCase
    public weak var view: GroceriesListViewController?
    
    typealias UseCase = (
        fetchGroceries: (_ categoryId: Int, _ completion: @escaping GroceriesClosure) -> Void,
        fetchImage: (_ imageName: String, _ completion: @escaping ImageClosure) -> Void,
        fetchThumbnail: (_ imageName: String, _ completion: @escaping ImageClosure) -> Void
    )
    
    // MARK: - Initializers
    
    init(categoryId: Int, router: GroceriesListRouter, useCase: UseCase) {
        self.categoryId = categoryId
        self.router = router
        self.useCase = useCase
    }
    
}

// MARK: - GroceriesListPresenterProtocol

extension GroceriesListPresenter: GroceriesListPresenterProtocol {
    
    func onThumbnailUpdate(imageName: String, completion: @escaping ImageClosure) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.useCase.fetchThumbnail(imageName) { data in
                completion(data)
            }
        }
    }
    
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self.useCase.fetchGroceries(self.categoryId) { category in
                self.useCase.fetchImage(category.image.name) { image in
                    self.view?.updateCoverImage(image: image)
                }
                DispatchQueue.main.async {
                    self.view?.updateCoverTitle(title: category.details.uppercased())
                    let groceriesList = category.groceries?
                        .groceries
                        .compactMap { GroceryItemViewModel(using: $0) }
                    self.view?.updateGroceries(groceriesList: groceriesList ?? [])
                }
            }
        }
    }
    
}
