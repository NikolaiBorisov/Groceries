//
//  ImagesAPI.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 11.02.2022.
//

import UIKit

typealias ImageClosure = (UIImage) -> Void

protocol ImagesAPI {
    func fetchThumbnail(imageName: String, completion: @escaping ImageClosure)
    func fetchImage(imageName: String, completion: @escaping ImageClosure)
}
