//
//  ProfileModuleBuilder.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import UIKit

final class ProfileModuleBuilder {
    
    static func build(using navigationFactory: NavigationFactory) -> UIViewController {
        let vc = ProfileViewController()
        vc.title = "Profile"
        return navigationFactory(vc)
    }
    
}
