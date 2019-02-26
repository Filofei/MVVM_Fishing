//
//  ImageType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 25/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// A protocol for any item that can have an image.

protocol ImageType {
    
    /// A UIImage depicting the image of the object.
    var image: UIImage { get }
}

