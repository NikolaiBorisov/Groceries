//
//  ImageHTTPRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 15.03.2022.
//

import Foundation
import Alamofire
import AlamofireImage

enum ImageHTTPRouter {
    case downloadThumbnail(imageName: String)
    case downloadImage(imageName: String)
}

extension ImageHTTPRouter {
    
    var baseURLString: String { "https://letscodeeasy.com/groceryapi/public/api" }
    
    var path: String {
        switch self {
        case .downloadThumbnail(let imageName):
            return "/thumbnail/show/\(imageName)"
        case .downloadImage(let imageName):
            return "/image/show/\(imageName)"
        }
    }
    
    var method: HTTPMethod { .get }
    
    var headers: HTTPHeaders? { ["Content-Type": "application/json; charset=UTF-8"] }
    
    var parameters: Parameters? { nil }
    
    func body() throws -> Data? {
        switch self {
        case .downloadThumbnail, .downloadImage:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseURLString.asURL()
        url.appendPathComponent(path)
        var request = try URLRequest(url: url, method: method, headers: headers)
        request.httpBody = try body()
        return request
    }
    
    func download(using imageHTTPService: ImageHTTPService, completion: @escaping ImageDataResponse) throws {
        try imageHTTPService.download(asURLRequest(), completion: completion)
    }
    
}
