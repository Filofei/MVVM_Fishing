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
    
    let image: UIImage?
    
    let name: String
    
    let baseID: String
    
    /// The average depth of the location.
    
    var averageDepth: Int {
        get {
            return (minDepth + maxDepth)/2
        }
    }
    
    
    
    var depthMap: DepthMap {
        return DepthMapGenerator.generateMap(minDepth, maxDepth, numberOfRows)
    }
    
    let minDepth: Int
    let maxDepth: Int
    
    /// The value of this constant should be strictly between 0 and 15.
    
    let numberOfRows: Int
    var fishPopulation: FishPopulation
}
