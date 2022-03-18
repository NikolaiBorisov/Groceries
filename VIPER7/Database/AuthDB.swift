//
//  AuthDB.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation

protocol AuthDB {
    func saveToken(tokenUser: TokenUser) -> Bool
    func saveUser(using user: User) -> Bool
}
