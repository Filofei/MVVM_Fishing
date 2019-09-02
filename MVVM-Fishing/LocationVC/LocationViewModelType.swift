//
//  LocationViewModelType.swift

import UIKit

protocol LocationViewModelType {
    var location: Location? { get set }
    var tackleStatus: TackleState { get set }
    var locationImage: UIImage? { get }
}
