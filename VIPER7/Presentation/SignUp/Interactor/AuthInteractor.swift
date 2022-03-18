//
//  AuthInteractor.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

protocol AuthInteractorProtocol: AnyObject {
    
}

enum AuthResult<T> {
    case success(result: T)
    case failure(error: String)
}

final class AuthInteractor {
    
    // MARK: - Public Properties
    
    static let shared = AuthInteractor()
    
    // MARK: - Private Properties
    
    private let authAPI: AuthAPI
    
    // MARK: - Initializers
    
    private init(authAPI: AuthAPI = AuthService.shared) {
        self.authAPI = authAPI
    }
    
}

// MARK: - AuthInteractorProtocol

extension AuthInteractor {
    
    func signUp(
        userName: String,
        email: String,
        password: String,
        completion: @escaping (AuthResult<String>) -> Void
    ) {
        authAPI.signUp(
            userName: userName,
            email: email,
            password: password,
            success: { _, _, _ in
                completion(.success(result: "Sign Up is Successful!"))
            },
            failure: { error in
                completion(.failure(error: error))
            }
        )
    }
    
    func login() {
        
    }
    
}
