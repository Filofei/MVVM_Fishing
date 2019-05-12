//
//  ScrollBarDelegate.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 02/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// The protocol for ScrollBar.

@objc public protocol ScrollBarDelegate: class {
    @objc func didSelectCell(atIndex index: Int)
}
