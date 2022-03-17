//
//  Window.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 17.03.2022.
//

import UIKit

final class Window: UIWindow {
    
    // MARK: - Public Properties
    
    public var presenter: WindowPresenterProtocol!
    
    // MARK: - Initializers
    
    override init(windowScene scene: UIWindowScene) {
        super.init(windowScene: scene)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
