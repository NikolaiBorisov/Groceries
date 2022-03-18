//
//  ImageHTTPService.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 15.03.2022.
//

import Foundation
import Alamofire
import AlamofireImage

typealias ImageDataResponse = (AFIDataResponse<Image>) -> (Void)

final class ImageHTTPService {
    
    // MARK: - Public Properties
    
    public let imageDownloader: ImageDownloader
    static let shared = ImageHTTPService()
    
    // MARK: - Initializers
    
    private init() {
        self.imageDownloader = ImageDownloader()
    }
    
    // MARK: - Public Methods
    
    func download(_ urlRequest: URLRequestConvertible, completion: @escaping ImageDataResponse) {
        imageDownloader.download(urlRequest, completion: completion)
    }
    
}
