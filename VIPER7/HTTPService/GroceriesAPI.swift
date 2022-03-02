//
//  GroceriesAPI.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation

typealias GroceriesClosure = (GroceryResult) -> (Void)
typealias CategoriesClosure = ([Category]) -> (Void)

protocol GroceriesAPI {
    func fetchCategories(completion: @escaping CategoriesClosure)
    func fetchGroceries(completion: GroceriesClosure)
}
