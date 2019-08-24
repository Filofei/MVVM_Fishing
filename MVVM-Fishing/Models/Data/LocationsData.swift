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
        [Location(image: UIImage(named: "country_1.jpg"), name: "Заросли", base: Bases.country, minDepth: 20, maxDepth: 140, numberOfRows: 5, fishPopulation: FishPopulation()),
         Location(image: UIImage(named: "country_2.jpg"), name: "Березки", base: Bases.country, minDepth: 10, maxDepth: 100, numberOfRows: 7, fishPopulation: FishPopulation())],
        
        // 1. Moscow river
        [Location(image: UIImage(named: "moscow_river_1.jpg"), name: "Ясный день", base: Bases.moscowRiver, minDepth: 80, maxDepth: 250, numberOfRows: 7, fishPopulation: FishPopulation()),
         Location(image: UIImage(named: "moscow_river_2.jpg"), name: "Лёгкая рябь", base: Bases.moscowRiver, minDepth: 100, maxDepth: 350, numberOfRows: 10, fishPopulation: FishPopulation())],
        
        // 2. Platnik
        [Location(image: UIImage(named: "platnik_1.jpg"), name: "Синяя гладь", base: Bases.platnik, minDepth: 0, maxDepth: 300, numberOfRows: 7, fishPopulation: FishPopulation()),
         Location(image: UIImage(named: "platnik_2.jpg"), name: "У развилки", base: Bases.platnik, minDepth: 50, maxDepth: 320, numberOfRows: 10, fishPopulation: FishPopulation())],
        
        // 3. Ob
        [Location(image: UIImage(named: "ob_1.jpg"), name: "Тёмная вода", base: Bases.ob, minDepth: 120, maxDepth: 500, numberOfRows: 7, fishPopulation: FishPopulation()),
        Location(image: UIImage(named: "ob_2.jpg"), name: "Скалы", base: Bases.ob, minDepth: 150, maxDepth: 420, numberOfRows: 10, fishPopulation: FishPopulation())]
    ]
}
