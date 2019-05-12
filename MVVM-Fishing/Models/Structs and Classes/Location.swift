//
//  Location.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// A struct that represents a location of a certain base.

struct Location {
    
    let image: UIImage
    
    let name: String
    
    let base: Bases
    /// The average depth of the location.
    var averageDepth: Int {
        get {
            return (minDepth + maxDepth)/2
        }
    }
    
    let minDepth: Int
    let maxDepth: Int
    /// The number 
    let numberOfRows: Int
    var depthMap: DepthMap
    var fishPopulation: FishPopulation
}
