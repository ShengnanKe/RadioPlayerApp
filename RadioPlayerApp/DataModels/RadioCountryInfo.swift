//
//  RadioCountryInfo.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/12/24.
//

import Foundation

struct RadioCountryInfo: Decodable, Identifiable, Hashable, RadioInfo {
    let stationUUID: String
    let name: String
    let url: String
    let urlResolved: String
    let country: String

    enum CodingKeys: String, CodingKey {
        case stationUUID = "stationuuid"
        case name
        case url
        case urlResolved = "url_resolved"
        case country
    }
}
