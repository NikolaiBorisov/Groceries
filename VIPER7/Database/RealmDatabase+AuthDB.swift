//
//  RealmDatabase+AuthDB.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 18.03.2022.
//

import Foundation
import RealmSwift

extension RealmDatabase: AuthDB {
    
    func saveUser(using user: User) -> Bool {
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(RealmUser(using: user), update: .all)
            }
        } catch {
            print("Something went wrong while saving user!: \(error.localizedDescription)")
            return false
        }
        return true
    }
    
    func saveToken(tokenUser: TokenUser) -> Bool {
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(RealmTokenUser(using: tokenUser), update: .all)
            }
        } catch {
            print("Error on token save: \(error)")
            return false
        }
        return true
    }
    
}
