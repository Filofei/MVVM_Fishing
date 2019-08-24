//
//  Fish.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// A struct that represents a fish species which can be caught on the location.

struct Fish {
    
    var image: UIImage
    
    var name: String
    
    var minWeight: Double
    
    var maxWeight: Double
    
    var prefersNight: Bool
    
    var passive: Bool
    
}
