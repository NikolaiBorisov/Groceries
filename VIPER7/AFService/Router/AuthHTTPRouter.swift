//
//  AuthHTTPRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation
import Alamofire

enum AuthHTTPRouter {
    case login(AuthModel)
    case signUp(AuthModel)
}

// MARK: - HTTPRouter

extension AuthHTTPRouter: HTTPRouter {
    
    var baseURLString: String {
        "https://letscodeeasy.com/groceryapi/public/api"
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .signUp:
            return "register"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login, .signUp:
            return ["Content-Type": "application/json; charset=UTF-8"]
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    func body() throws -> Data? {
        switch self {
        case .login(let user), .signUp(let user):
            return try JSONEncoder().encode(user)
        }
    }
    
}
