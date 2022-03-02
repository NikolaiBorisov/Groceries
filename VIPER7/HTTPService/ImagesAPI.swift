//
//  ImagesAPI.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 11.02.2022.
//

import Foundation

typealias ImageClosure = (Data?) -> Void

protocol ImagesAPI {
    func fetchThumbnail(imageName: String, completion: @escaping ImageClosure)
    func fetchImage(imageName: String, completion: @escaping ImageClosure)
}
