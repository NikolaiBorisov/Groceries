//
//  RealmTokenUser.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation
import RealmSwift

final class RealmTokenUser: Object {
    
    @objc dynamic var accessToken: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var loggedIn: Bool = false
    @objc dynamic var updatedAt: Date = Date()
    
    override class func primaryKey() -> String? {
        "email"
    }
    
}

//. MARK: - RealmTokenUser

extension RealmTokenUser {
    
    convenience init(using model: TokenUser) {
        self.init()
        self.accessToken = model.accessToken
        self.email = model.email
        self.loggedIn = model.loggedIn
    }
    
}

//. MARK: - TokenUser

extension TokenUser {
    
    init(using entity: RealmTokenUser) {
        self.accessToken = entity.accessToken
        self.email = entity.email
        self.loggedIn = entity.loggedIn
    }
    
}
