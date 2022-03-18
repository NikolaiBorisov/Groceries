//
//  RealmUser.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation
import RealmSwift

final class RealmUser: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    
    override class func primaryKey() -> String? {
        "email"
    }
    
}

// MARK: - RealmUser

extension RealmUser {
    
    convenience init(using model: User) {
        self.init()
        self.name = model.username
        self.email = model.email
    }
}

// MARK: - User

extension User {
    
    init(using entity: RealmUser) {
        self.id = entity.id
        self.username = entity.name
        self.email = entity.email
    }
    
}
