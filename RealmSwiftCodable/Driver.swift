//
//  Driver.swift
//  RealmSwiftCodable
//
//  Created by Adib Contractor on 10/9/18.
//  Copyright © 2018 Adib Contractor. All rights reserved.
//

import Foundation
import RealmSwift

class Driver {
    func loadBasicModels()
    {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let user = try? JSONDecoder().decode(User.self, from: data) else {
                return
            }
            print(user)
        } catch {
        }
    }
    
    func storeModels()
    {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            guard let user = try? JSONDecoder().decode(StoredUser.self, from: data) else {
                return
            }
            
            let realm = try Realm()
            print(realm.configuration.fileURL?.absoluteString ?? "")
            
            try realm.write {
                realm.add(user, update: true)
            }
            
        } catch {
        }
    }
}
