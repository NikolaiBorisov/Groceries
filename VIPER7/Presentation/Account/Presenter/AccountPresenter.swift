//
//  AccountPresenter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

protocol AccountPresenterProtocol {
    func viewDidLoad()
}

final class AccountPresenter {
    
    // MARK: - Public Properties
    
    public weak var view: AccountViewProtocol?
    
    // MARK: - Private Properties
    
    private let router: AccountRouterProtocol
    
    // MARK: - Initializers
    
    init(router: AccountRouterProtocol) {
        self.router = router
    }
    
}

// MARK: - AccountPresenterProtocol

extension AccountPresenter: AccountPresenterProtocol {
    
    func viewDidLoad() {
        router.showLogin()
    }
    
}
