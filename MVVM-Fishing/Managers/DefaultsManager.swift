//
//  DefaultsManager.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 10/04/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

/// This enum contains UserDefaults keys as raw values.
public enum DefaultsKeys: String {
    case numberOfLaunches = "numberOfLaunches"
}

class DefaultsManager {
    
    private let defaults = UserDefaults.standard
    
    public func saveNumberOfLaunches(key: String) {
        if key != DefaultsKeys.numberOfLaunches.rawValue {
            print("You've passed the wrong key!")
            return
        }
        let currentNumber = retrieveValue(key) as? Int
        saveValue(key, (currentNumber ?? 0) + 1)
    }
    
    /// This function saves and logs the state of the value for certain key.
    public func saveValue(_ key: String, _ value: Any) {
        if let oldValue = defaults.value(forKey: key) {
            print("""
                The previous value for key: \(key) was \(oldValue).\n
                Setting the new value: \(value).
                """)
            defaults.set(value, forKey: key)
        } else {
            print("""
                There is no value for key: \(key).\n
                Setting the new value: \(value).
                """)
            defaults.set(value, forKey: key)
        }
    }
    /// This function retrieves and logs the value for certain key.
    public func retrieveValue(_ key: String) -> Any? {
        var value: Any?
        if let currentValue = defaults.value(forKey: key) {
            print("The current value for key is: \(currentValue).")
            value = currentValue
        } else {
            print("There is no value for key: \(key).")
            value = nil
        }
        return value
    }
}
