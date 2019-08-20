//
//  PondMenuTableViewCellViewModelType.swift

import Foundation

protocol PondMenuTableViewCellViewModelType: class {
    var index: Int { get set }
    var currentBase: Base? { get set }
    var locationName: String { get }
}
