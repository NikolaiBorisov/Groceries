//
//  CategoryItemViewModel.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 11.02.2022.
//

import Foundation

struct CategoryItemViewModel {
    
    let id: Int
    let title: String
    let details: String
    let imageName: String
    
    init(using categoryModel: Category) {
        self.id = categoryModel.id
        self.title = categoryModel.category
        self.details = categoryModel.details
        self.imageName = categoryModel.image.name
    }
}
