//
//  GroceriesAPI.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation

typealias GroceriesClosure = (Category) -> (Void)
typealias CategoriesClosure = ([Category]) -> (Void)

protocol GroceriesAPI {
    func fetchCategories(completion: @escaping CategoriesClosure)
    func fetchGroceries(categoryId: Int, completion: @escaping (Category) -> (Void))
}
