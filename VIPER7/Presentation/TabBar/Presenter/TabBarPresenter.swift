//
//  TabBarPresenter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import Foundation

protocol TabBarPresenterProtocol {
    func viewDidLoad()
}

final class TabBarPresenter {
    
    // MARK: - Public Properties
    
    typealias UseCase = (getCartCount: (@escaping CartCountClosure) -> Void, ())
    public weak var view: TabBarViewProtocol?
    public var useCase: UseCase
    
    // MARK: - Initializers
    
    init(useCase: TabBarPresenter.UseCase) {
        self.useCase = useCase
    }
    
}

// MARK: - TabBarPresenterProtocol

extension TabBarPresenter: TabBarPresenterProtocol {
    
    func viewDidLoad() {
        useCase.getCartCount {
            self.view?.updateCartCount(count: $0)
        }
    }
    
}
