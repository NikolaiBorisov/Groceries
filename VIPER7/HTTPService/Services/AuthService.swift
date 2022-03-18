//
//  AuthService.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

final class AuthService {
    
    // MARK: - Public Properties
    
    static let shared = AuthService()
    
    // MARK: - Private Properties
    
    private lazy var httpService = AuthHTTPService()
    
    // MARK: - Initializers
    
    private init(httpService: AuthHTTPService = AuthHTTPService()) {
        self.httpService = httpService
    }
    
}

// MARK: - AuthAPI

extension AuthService: AuthAPI {
    
    func signUp(
        userName: String,
        email: String,
        password: String,
        success: @escaping (String, String, Int) -> Void,
        failure: @escaping (String) -> Void
    ) {
        do {
            try AuthHTTPRouter
                .signUp(AuthModel(name: userName, email: email, password: password))
                .request(using: httpService)
                .responseJSON(completionHandler: { response in
                    guard response.response?.statusCode == 200 else {
                        do {
                            if let data = response.data {
                                let authError = try JSONDecoder().decode(SignUpError.self, from: data)
                                if let nameError = authError.validationErrors.name?.first {
                                    failure(nameError)
                                    return
                                }
                                if let emailError = authError.validationErrors.email?.first {
                                    failure(emailError)
                                    return
                                }
                                if let passwordError = authError.validationErrors.password?.first {
                                    failure(passwordError)
                                    return
                                }
                            }
                        } catch {
                            print("Sign up parsing failed with error = \(error.localizedDescription)")
                            failure("Sign up failed")
                        }
                        return
                    }
                    let dictionary = response.value as? [String: Any]
                    guard
                        let accessToken = dictionary?["access_token"] as? String,
                        let tokenType = dictionary?["token_type"] as? String,
                        let expiredIn = dictionary?["expires_in"] as? Int
                    else {
                        print("Sign up token parsing failed")
                        return
                    }
                    success(accessToken, tokenType, expiredIn)
                })
        } catch  {
            print("Sign up failed with error = \(error.localizedDescription)")
            failure("Sign up failed with error")
        }
    }
    
    func login(
        email: String,
        password: String,
        success: @escaping (String) -> Void,
        failure: @escaping (String) -> Void
    ) {
        
    }
    
}
