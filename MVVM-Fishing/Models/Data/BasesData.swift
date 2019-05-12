//
//  BasesData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 25/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

struct BasesData {
    // TODO: Remove image placeholders
    private init(){}

    /// Array containing bases data to be visited by the player.
    static let bases: [Base] = [
        Base(image: UIImage(), name: Bases.country.rawValue, locations: LocationsData.locations[0], dailyPrice: 0, levelRequired: 0, description: "Описание базы 1."),
        Base(image: UIImage(), name: Bases.moscowRiver.rawValue, locations: LocationsData.locations[1], dailyPrice: 1000, levelRequired: 3, description: "Описание базы 2.")
    ]
}
