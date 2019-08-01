//
//  LocationsData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 25/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

struct LocationsData {
    // TODO: Remove image placeholders
    private init(){}
    
    // TODO: Correct depth map and fish population.
    static let locations: [[Location]] = [
        [Location(image: UIImage(), name: "Мостик на пруду", base: Bases.country, minDepth: 20, maxDepth: 140, numberOfRows: 5, depthMap: DepthMap(), fishPopulation: FishPopulation()),
         Location(image: UIImage(), name: "Тихая заводь", base: Bases.country, minDepth: 10, maxDepth: 100, numberOfRows: 7, depthMap: DepthMap(), fishPopulation: FishPopulation())],
        [Location(image: UIImage(), name: "Набережная", base: Bases.moscowRiver, minDepth: 80, maxDepth: 250, numberOfRows: 7, depthMap: DepthMap(), fishPopulation: FishPopulation()),
         Location(image: UIImage(), name: "Быстрое течение", base: Bases.moscowRiver, minDepth: 100, maxDepth: 300, numberOfRows: 10, depthMap: DepthMap(), fishPopulation: FishPopulation())],
        [Location(image: UIImage(), name: "Камыши", base: Bases.platnik, minDepth: 30, maxDepth: 160, numberOfRows: 8, depthMap: DepthMap(), fishPopulation: FishPopulation()),
         Location(image: UIImage(), name: "У развилки", base: Bases.platnik, minDepth: 50, maxDepth: 320, numberOfRows: 10, depthMap: DepthMap(), fishPopulation: FishPopulation())]
    ]
}
