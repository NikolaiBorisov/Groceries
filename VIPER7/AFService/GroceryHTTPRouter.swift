//
//  GroceryHTTPRouter.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation
import Alamofire

enum GroceryHTTPRouter {
    case getGroceryCategories
    case getGroceries(categoryId: String)
    case downloadThumbnail(imageName: String)
    case downloadImage(imageName: String)
}

// MARK: - HTTPRouter

extension GroceryHTTPRouter: HTTPRouter {
    
    var baseURLString: String { "https://letscodeeasy.com/groceryapi/public/api" }
    
    var path: String {
        switch self {
        case .getGroceryCategories:
            return "/categories"
        case .getGroceries(let categoryId):
            return "/category/\(categoryId)"
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
        case .getGroceryCategories, .getGroceries, .downloadThumbnail, .downloadImage:
            return nil
        }
    }
    
}
