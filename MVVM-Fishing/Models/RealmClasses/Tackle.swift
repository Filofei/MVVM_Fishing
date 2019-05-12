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
    
    @objc dynamic var name: String? = "Снасть"
    @objc dynamic var rod: Rod? = nil
    @objc dynamic var reel: Reel? = nil
    @objc dynamic var line: Line? = nil
    @objc dynamic var hook: Hook? = nil
    @objc dynamic var complete: Bool = false
    
    private var itemsArray: Array<Object?> = [] {
        didSet {
            completionChecker()
        }
    }
    
    convenience init(name: String, rod: Rod?, reel: Reel?, line: Line?, hook: Hook?) {
        self.init()
        self.name = name
        self.rod = rod
        self.reel = reel
        self.line = line
        self.hook = hook
        itemsArray = [self.rod, self.reel, self.line, self.hook]
    }
    private func completionChecker() {
        Array(arrayLiteral: rod, reel, line, hook).forEach { (item) in
            if item == nil {
                return
            } else {
                complete = true
            }
        }
    }
}
