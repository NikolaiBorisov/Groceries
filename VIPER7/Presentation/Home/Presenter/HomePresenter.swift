//
//  HomePresenter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad()
    // func onAddToCart(skuItem: SkuItem)
    func onFetchThumbnail(imageName: String, completion: @escaping ImageClosure)
    func onCategorySelection(using category: (id: Int, title: String))
}

final class HomePresenter {
    
    // MARK: - Public Properties
    
    typealias UseCase = (
        getCategories: (_ completion: @escaping CategoriesClosure) -> Void,
        // addToCart: (SkuItem) -> Bool,
        getCartItem: (String) -> CartItem,
        fetchThumbnail: (_ imageName: String, _ completion: @escaping ImageClosure) -> Void
    )
    public weak var view: HomeViewController?
    public var useCase: UseCase?
    public var router: HomeRouterProtocol
    
    // MARK: - Initializers
    
    init(
        view: HomeViewController,
        router: HomeRouterProtocol,
        useCase: HomePresenter.UseCase
    ) {
        self.view = view
        self.router = router
        self.useCase = useCase
    }
    
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    
    func onCategorySelection(using category: (id: Int, title: String)) {
        router.routeToGroceriesListing(using: category)
    }
    
    func onFetchThumbnail(imageName: String, completion: @escaping ImageClosure) {
        DispatchQueue.global(qos: .background).async {
            self.useCase?.fetchThumbnail(imageName) { image in
                completion(image)
            }
        }
    }
    
//    func onAddToCart(skuItem: SkuItem) {
//        let updated = self.useCase?.addToCart(skuItem)
//        print("Add to cart updated with result = \(String(describing: updated))")
//        //            DispatchQueue.main.async {
//        //                // Spinner implementation
//        //            }
//        //        }
//    }
    
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async {
            self.useCase?.getCategories { [weak self] categories in
                guard let self = self else { return }
                self.view?.loadCategories(
                    categoriesList: categories.compactMap { CategoryItemViewModel(using: $0) }
                )
            }
        }
    }
    
}
