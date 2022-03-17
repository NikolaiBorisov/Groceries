//
//  WindowPresenter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import Foundation

protocol WindowPresenterProtocol {
    func initialize()
}

final class WindowPresenter {
    
    // MARK: - Private Properties
    
    private let router: WindowRouterProtocol
    
    // MARK: - Initializers
    
    init(router: WindowRouterProtocol) {
        self.router = router
        
        initialize()
    }
    
}

// MARK: - WindowPresenterProtocol

extension WindowPresenter: WindowPresenterProtocol {
    
    func initialize() {
        router.routeTo(kind: .login)
    }
    
}
