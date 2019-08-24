//
//  Bases.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

/// An enum representing names of the bases to be visited by the player.

enum Bases: String {
    case country = "Деревня"
    case moscowRiver = "Москва-река"
    case platnik = "Рыбхоз"
    case ob = "Обь"
}

enum BasesDescriptions: String {
    case country = "Ваша родная деревня. У вас здесь дом и небольшой прудик. Ловите сколько душе угодно!"
    case moscowRiver = "Крупная река в центральной части России. Всего час езды от вашего дома. Место обитания множества видов рыб."
    case platnik = "Частное хозяйство, состоящее из нескольких прудов. Здесь в изобилии водится карп, карась, белый амур и другие представители карповых."
    case ob = "Крупная западносибирская река, протекающая неподалёку от города Барнаул."
}
