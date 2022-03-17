//
//  SceneDelegate.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 03.02.2022.
//

import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Public Properties
    
    var window: UIWindow?
    
    // MARK: - Private Properties
    
    private var config = Realm.Configuration()
    
    // MARK: - Public Methods
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = WindowBuilder.build(scene: windowScene)
        
        getPathToRealmFile()
    }
    
    // MARK: - Private Methods
    
    private func getPathToRealmFile() {
        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("contact.realm")
        Realm.Configuration.defaultConfiguration = config
        print("Path to Realm objects: \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
    }
    
//    private func createInitialVC() -> UITabBarController {
//        let submodules = (
//            home: HomeModuleBuilder.build(using: NavigationBuilder.build),
//            cart: CartModuleBuilder.build(using: NavigationBuilder.build),
//            profile: ProfileModuleBuilder.build(using: NavigationBuilder.build)
//        )
//        let tabBarController = TabBarModuleBuilder.build(using: submodules)
//        return tabBarController
//    }
    
}
