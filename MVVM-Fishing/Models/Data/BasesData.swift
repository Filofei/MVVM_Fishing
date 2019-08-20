//
//  BasesData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 25/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

struct BasesData {

    private init(){}

    /// Array containing bases data to be visited by the player.
    static let bases: [Base] = [
        Base(image: UIImage(named: "country_main.jpg"), name: Bases.country.rawValue, locations: LocationsData.locations[0], dailyPrice: 0, levelRequired: 1, description: BasesDescriptions.country.rawValue),
        Base(image: UIImage(named: "moscow_river_main.jpg"), name: Bases.moscowRiver.rawValue, locations: LocationsData.locations[1], dailyPrice: 1000, levelRequired: 3, description: BasesDescriptions.moscowRiver.rawValue),
        Base(image: UIImage(named: "platnik_main.jpg"), name: Bases.platnik.rawValue, locations: LocationsData.locations[2], dailyPrice: 3000, levelRequired: 5, description: BasesDescriptions.platnik.rawValue)
    ]
}
