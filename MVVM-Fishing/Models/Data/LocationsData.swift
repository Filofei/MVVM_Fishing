//
//  LocationsData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 25/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

struct LocationsData {
    
    // TODO: Correct depth map and fish population.
    static let locations: [[Location]] = [
        
        // 0. Country
        [Location(image: UIImage(named: "country_1.jpg"), name: Locations.Country.locations[0], baseID: Bases.country, minDepth: 20, maxDepth: 140, numberOfRows: 5, fishPopulation: FishPopulation()),
         Location(image: UIImage(named: "country_2.jpg"), name: Locations.Country.locations[1], baseID: Bases.country, minDepth: 10, maxDepth: 100, numberOfRows: 7, fishPopulation: FishPopulation())],
        
        // 1. Moscow river
        [Location(image: UIImage(named: "moscow_river_1.jpg"), name: Locations.MoscowRiver.locations[0], baseID: Bases.moscowRiver, minDepth: 80, maxDepth: 250, numberOfRows: 7, fishPopulation: FishPopulation()),
         Location(image: UIImage(named: "moscow_river_2.jpg"), name: Locations.MoscowRiver.locations[1], baseID: Bases.moscowRiver, minDepth: 100, maxDepth: 350, numberOfRows: 10, fishPopulation: FishPopulation())],
        
        // 2. Platnik
        [Location(image: UIImage(named: "platnik_1.jpg"), name: Locations.Platnik.locations[0], baseID: Bases.platnik, minDepth: 0, maxDepth: 300, numberOfRows: 7, fishPopulation: FishPopulation()),
         Location(image: UIImage(named: "platnik_2.jpg"), name: Locations.Platnik.locations[1], baseID: Bases.platnik, minDepth: 50, maxDepth: 320, numberOfRows: 10, fishPopulation: FishPopulation())],
        
        // 3. Ob
        [Location(image: UIImage(named: "ob_1.jpg"), name: Locations.Ob.locations[0], baseID: Bases.ob, minDepth: 120, maxDepth: 500, numberOfRows: 7, fishPopulation: FishPopulation()),
        Location(image: UIImage(named: "ob_2.jpg"), name: Locations.Ob.locations[1], baseID: Bases.ob, minDepth: 150, maxDepth: 420, numberOfRows: 10, fishPopulation: FishPopulation())]
    ]
}
