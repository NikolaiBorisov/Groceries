//
//  GroceryHTTPService.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation
import Alamofire

final class GroceryHTTPService: HTTPService {
    
    // MARK: - Public Properties
    
    public var sessionManager: Session = Session.default
    
    // MARK: - Public Methods
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
    
}
