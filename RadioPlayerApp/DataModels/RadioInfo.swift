//
//  RadioInfo.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation

protocol RadioInfo: Identifiable, Hashable {
    var stationUUID: String { get }
    var name: String { get }
    var url: String { get }
    var urlResolved: String { get }
    var country: String { get }
}

extension RadioInfo {
    var id: String { stationUUID }
}
