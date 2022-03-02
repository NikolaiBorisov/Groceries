//
//  GroceryTabBarController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import UIKit
import RealmSwift

typealias GroceryTabs = (
    home: UIViewController,
    cart: UIViewController,
    profile: UIViewController
)

protocol TabBarViewProtocol: AnyObject {
    func updateCartCount(count: Int)
}

final class GroceryTabBarController: UITabBarController {
    
    // MARK: - Public Properties
    
    public var cartTab: UIViewController
    public var presenter: TabBarPresenterProtocol?
    
    // MARK: - Initializers
    
    init(tabs: GroceryTabs, presenter: TabBarPresenterProtocol) {
        self.cartTab = tabs.cart
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.home, tabs.cart, tabs.profile]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
}

// MARK: - TabBarViewProtocol

extension GroceryTabBarController: TabBarViewProtocol {
    
    func updateCartCount(count: Int) {
        cartTab.tabBarItem.badgeValue = count > 0 ? "\(count)" : nil
    }
    
}
