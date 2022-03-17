//
//  WindowRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

protocol WindowRouterProtocol {
    func routeTo(kind: WindowRouter.Kind)
}

final class WindowRouter {
    
    enum Kind {
        case login
        case home
    }
    
    typealias Submodules = (
        accountModule: () -> UIViewController,
        tabBarModule: () -> UIViewController
    )
    
    // MARK: - Private Properties
    
    private unowned let window: UIWindow
    private var accountView: UIViewController?
    private var tabBarView: UIViewController?
    
    // MARK: - Initializers
    
    init(_ window: Window, submodules: Submodules) {
        self.window = window
        self.accountView = submodules.accountModule()
        self.tabBarView = submodules.tabBarModule()
    }
    
}

// MARK: - WindowRouterProtocol

extension WindowRouter: WindowRouterProtocol {
    
    func routeTo(kind: WindowRouter.Kind) {
        var viewController: UIViewController?
        switch kind {
        case .login:
            viewController = self.accountView
        case .home:
            viewController = self.tabBarView
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
}
