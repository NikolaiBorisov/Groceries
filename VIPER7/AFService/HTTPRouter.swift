//
//  HTTPRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation
import Alamofire

protocol HTTPRouter: URLRequestConvertible {
    var baseURLString: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    
    func body() throws -> Data?
    func request(using httpService: HTTPService) throws -> DataRequest
}

// MARK: - HTTPRouter

extension HTTPRouter {
    
    var parameter: Parameters? { return nil }
    
    func body() throws -> Data? { return nil }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseURLString.asURL()
        url.appendPathComponent(path)
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        return request
    }
    
    func request(using httpService: HTTPService) throws -> DataRequest {
        return try httpService.request(asURLRequest())
    }
    
}
