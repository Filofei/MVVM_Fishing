//
//  RealmManager.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 20.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private let realm = try! Realm()

    public func initializeUserRealmData() {
        print(realm.configuration.fileURL!)
        try! realm.write {
            //realm.deleteAll()
            if realm.objects(User.self).isEmpty {
                realm.add(User())
            }
            if realm.objects(Tackle.self).isEmpty {
                (0...1).forEach {
                    realm.add(Tackle(id: MainPrimaryKeys.tackles[$0]))
                }
            }
        }
    }
    
    public func checkForObsoleteData() {
        guard let user = realm.object(ofType: User.self, forPrimaryKey: "user") else {
            fatalError(FatalErrorMessages.Realm.noUser.rawValue)
        }
        
        // Check for deprecated bases
        
        var basesNames: [String] = []
        
        BasesData.bases.forEach { basesNames.append($0.name) }
        
        if !basesNames.contains(user.currentBase) {
            try! realm.write {
                user.currentBase = BasesData.bases[0].name
            }
        }
    }
}
