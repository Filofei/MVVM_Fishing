//
//  AppearanceProtocol.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 06.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

protocol AppearanceProtocol {
    var controller: UIViewController? { get set }
    init(in controller: UIViewController)
    func setBackgroundColor()
    func applyColorToViews(_ views: [UIView], _ color: UIColor)
    func toggleViewAlpha(_ view: UIView, _ state: Bool, completion: (() -> Void)?)
    static func selectTableViewCell(_ selected: Bool, _ cell: UITableViewCell)
}
