//
//  Line.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

struct Line: ItemType, ImageType, Nameable, Breakable {
    
    var premium: Bool
    var price: Int
    
    var image: UIImage
    
    var name: String
    
    var resistance: Float
    
    var state: Float

}
