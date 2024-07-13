//
//  RadioKeywordInfo.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation

struct RadioKeywordInfo: Decodable, Identifiable, Hashable, RadioInfo {
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
