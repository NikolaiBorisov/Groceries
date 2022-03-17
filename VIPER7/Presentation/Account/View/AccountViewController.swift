//
//  AccountViewController.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 16.03.2022.
//

import UIKit

protocol AccountViewProtocol: AnyObject {
    
}

final class AccountViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public var presenter: AccountPresenterProtocol?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
}

// MARK: - AccountViewProtocol

extension AccountViewController: AccountViewProtocol {
    
}
