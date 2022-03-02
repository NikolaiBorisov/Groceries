//
//  HTTPService.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 09.02.2022.
//

import Foundation
import Alamofire

protocol HTTPService {
    var sessionManager: Session { get set }
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
