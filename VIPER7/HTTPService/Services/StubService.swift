//
//  StubService.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 04.02.2022.
//

import Foundation

final class StubService {
    
    // MARK: - Public Properties
    
    static let shared = StubService()
    
    // MARK: - Initializers
    
    private init() {}
    
}

// MARK: - GroceriesAPI

extension StubService: GroceriesAPI {
    
    func fetchCategories(completion: CategoriesClosure) {
        fatalError("No implementation for this yet")
    }
    
    func fetchGroceries(categoryId: Int, completion: @escaping (Category) -> (Void)) {
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let groceryResult = try JSONDecoder().decode(Category.self, from: data)
                completion(groceryResult)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
}
