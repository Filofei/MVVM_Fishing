//
//  Tackle.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 10/04/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation
import RealmSwift

class Tackle: Object {
    
    @objc dynamic var id: String? = nil
    @objc dynamic var rod: Rod? = nil
    @objc dynamic var reel: Reel? = nil
    @objc dynamic var line: Line? = nil
    @objc dynamic var hook: Hook? = nil
    @objc dynamic var bait: Bait? = nil
    @objc dynamic var complete: Bool = false
    
    convenience init(id: String, rod: Rod?, reel: Reel?, line: Line?, hook: Hook?, bait: Bait?) {
        self.init()
        self.id = id
        self.rod = rod
        self.reel = reel
        self.line = line
        self.hook = hook
        self.bait = bait
    }
    
    convenience init(id: String) {
        self.init()
        self.id = id
    }
    
    private func getClassProps() -> [ItemType?] {
        return Array(arrayLiteral: rod, reel, line, hook, bait) as Array<ItemType?>
    }
    
    public func checkCompletion() {
        if getClassProps().contains(where: {$0 == nil}) {
            try! realm?.write {
                complete = false
            }
        } else {
            try! realm?.write {
                complete = true
            }
        }
        print(complete)
    }
    
    public func compareItems( _ value: ItemType?) -> ItemType? {
        var output: ItemType?
        getClassProps().forEach {
            if $0?.id == value?.id {
                output = $0
            }
        }
        return output
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
    
}
