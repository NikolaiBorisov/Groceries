//
//  RealmDatabase.swift
//  VIPER7
//
//  Created by NIKOLAI BORISOV on 07.02.2022.
//

import RealmSwift

typealias CartCountClosure = (Int) -> Void

protocol CartDBProtocol {
    func getCartItem(using skuId: String) -> CartItem
    func updateCart(using cartItem: CartItem) -> Bool
    func getCount(closure: @escaping CartCountClosure)
    func delete(using skuId: String) -> Bool
}

final class RealmDatabase {
    
    // MARK: - Public Properties
    
    static let shared: RealmDatabase = RealmDatabase()
    public var notificationToken: NotificationToken?
    public let realm = try! Realm()
    
    // MARK: - Initializers
    
    private init() {}
    
    deinit {
        notificationToken?.invalidate()
    }
    
}

// MARK: - CartDBProtocol

extension RealmDatabase: CartDBProtocol {
    
    func getCartItem(using skuId: String) -> CartItem {
        guard let realmObject = realm
                .objects(RealmCartItem.self)
                .first(where: { $0.skuId == skuId }) else {
                    return CartItem(skuId: skuId, value: 0)
                }
        return CartItem(realmCartItem: realmObject)
    }
    
    func delete(using skuId: String) -> Bool {
        do {
            try realm.write {
                if let realmObject = realm.objects(RealmCartItem.self)
                    .first(where: { $0.skuId == skuId }) {
                    realm.delete(realmObject)
                }
            }
        } catch {
            print("Something went wrong: \(error)")
            return false
        }
        return true
    }
    
    func getCount(closure: @escaping CartCountClosure) {
        let results = realm.objects(RealmCartItem.self)
        notificationToken = results.observe({ _ in
            print("My Realm Objects Count: \(results.count)")
            closure(results.count)
        })
    }
    
    func updateCart(using cartItem: CartItem) -> Bool {
        do {
            try realm.write {
                realm.add(RealmCartItem(cartItem: cartItem), update: .modified)
            }
        } catch {
            print("Something went wrong: \(error)")
            return false
        }
        return true
    }
    
}
