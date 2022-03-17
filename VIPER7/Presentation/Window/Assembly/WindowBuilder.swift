//
//  WindowBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

final class WindowBuilder {
    
    static func build(scene: UIWindowScene) -> UIWindow {
        let window = Window(windowScene: scene)
        let router = WindowRouter(
            window,
            submodules: (
                accountModule: AccountBuilder.build,
                tabBarModule: TabBarModuleBuilder.build
            )
        )
        let presenter = WindowPresenter(router: router)
        window.presenter = presenter
        return window
    }
    
}
