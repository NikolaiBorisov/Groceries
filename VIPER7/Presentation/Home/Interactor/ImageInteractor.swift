//
//  ImageInteractor.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 11.02.2022.
//

import Foundation

final class ImageInteractor {
    
    // MARK: - Public Properties
    
    public let service: ImagesAPI
    
    // MARK: - Initializers
    
    init(service: ImagesAPI) {
        self.service = service
    }
    
}

// MARK: - ImageInteractor

extension ImageInteractor {
    
    func fetchThumbnail(imageName: String, completion: @escaping ImageClosure) {
        service.fetchThumbnail(imageName: imageName, completion: completion)
    }
    
    func fetchImage(imageName: String, completion: @escaping ImageClosure) {
        service.fetchImage(imageName: imageName, completion: completion)
    }
    
}
