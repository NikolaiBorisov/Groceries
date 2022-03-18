//
//  AuthInteractor.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

enum AuthResult<T> {
    case success(result: T)
    case failure(error: String)
}

final class AuthInteractor {
    
    // MARK: - Public Properties
    
    static let shared = AuthInteractor()
    
    // MARK: - Private Properties
    
    private let authAPI: AuthAPI
    private let database: AuthDB
    
    // MARK: - Initializers
    
    private init(
        authAPI: AuthAPI = AuthService.shared,
        database: AuthDB = RealmDatabase.shared
    ) {
        self.authAPI = authAPI
        self.database = database
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
    
    func login(
        email: String,
        password: String,
        completion: @escaping (AuthResult<String>) -> Void
    ) {
        authAPI.login(
            email: email,
            password: password,
            success: { [weak self] token in
                _ = self?.database.saveToken(tokenUser: TokenUser(accessToken: token, email: email, loggedIn: true))
                completion(.success(result: token))
            },
            failure: { error in
                completion(.failure(error: error))
            }
        )
    }
    
    func validate(
        using token: String,
        completion: @escaping (AuthResult<User>) -> Void) {
            authAPI.validate(
                token: token,
                success: { [weak self] user in
                    _ = self?.database.saveUser(using: user)
                    completion(.success(result: user))
                },
                failure: { error in
                    completion(.failure(error: error))
                }
            )
        }
    
}
