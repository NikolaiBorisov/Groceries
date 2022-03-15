//
//  GroceryService.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import UIKit
import Alamofire

final class GroceryService {
    
    // MARK: - Public Properties
    
    static let shared = GroceryService()
    
    // MARK: - Private Properties
    
    private lazy var httpService = GroceryHTTPService()
    
    // MARK: - Initializers
    
    private init() {}
    
}

// MARK: - GroceriesAPI

extension GroceryService: GroceriesAPI {
    
    func fetchCategories(completion: @escaping ([Category]) -> (Void)) {
        // Call to fetch Categories
        do {
            try GroceryHTTPRouter
                .getGroceryCategories
                .request(using: httpService)
                .response(completionHandler: { // result in
                    //let categories = GroceryService.parseCategories(result: result)
                    completion(GroceryService.parseCategories(result: $0))
                })
        } catch {
            print("Something went wrong while fetching Categories = \(error)")
        }
    }
    
    func fetchGroceries(categoryId: Int, completion: @escaping (Category) -> (Void)) {
        do {
            try GroceryHTTPRouter
                .getGroceries(categoryId: categoryId)
                .request(using: httpService)
                .response(completionHandler: { result in
                    let groceriesResult = GroceryService.parseGroceriesResult(result: result)
                    guard let category = groceriesResult else { return }
                    completion(category)
                })
        } catch {
            print("Something went wrong while fetching Categories = \(error)")
        }
    }
    
}

// MARK: - GroceryService

extension GroceryService {
    
    private static func parseCategories(result: DataResponse<Data?, AFError>) -> [Category] {
        guard [200, 201].contains(result.response?.statusCode),
              let data = result.data else { return [] }
        do {
            return try JSONDecoder().decode(Categories.self, from: data).data
        } catch {
            print("Something went wrong while parsing categories response")
        }
        return []
    }
    
    private static func parseGroceriesResult(result: DataResponse<Data?, AFError>) -> Category? {
        guard [200, 201].contains(result.response?.statusCode),
              let data = result.data else { return nil }
        do {
            return try JSONDecoder().decode(SingleCategoryResult.self, from: data).category
        } catch {
            print("Something went wrong while parsing groceries response: \(error)")
        }
        return nil
    }
    
}

// MARK: - ImagesAPI

extension GroceryService: ImagesAPI {
    
    func fetchImage(imageName: String, completion: @escaping ImageClosure) {
        do {
            try GroceryHTTPRouter
                .downloadImage(imageName: imageName)
                .request(using: httpService)
                .responseData(completionHandler: { result in
                    completion(result.data)
                })
        } catch {
            print("Something went wrong while fetching image \(error)")
        }
    }
    
    func fetchThumbnail(imageName: String, completion: @escaping ImageClosure) {
        do {
            try GroceryHTTPRouter
                .downloadThumbnail(imageName: imageName)
                .request(using: httpService)
                .responseData(completionHandler: { result in
                    completion(result.data)
                })
        } catch {
            print("Something went wrong while fetching thumbnail \(error)")
        }
    }
    
}
