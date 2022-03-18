//
//  AuthAPI.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

protocol AuthAPI {
    
    func signUp(
        userName: String,
        email: String,
        password: String,
        success: @escaping (_ token: String, _ tokenType: String, _ expiresIn: Int) -> Void,
        failure: @escaping (_ error: String) -> Void
    )
    
    func login(
        email: String,
        password: String,
        success: @escaping (_ token: String) -> Void,
        failure: @escaping (_ error: String) -> Void
    )
    
}
