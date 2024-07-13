//
//  RadioKeywordRequest.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation

struct RadioKeywordRequest: RequestBuilder {
    var baseUrl: String {
        "https://bando-radio-api.p.rapidapi.com"
    }

    var path: String? {
        "/stations/byname/\(keyword)"
    }

    var method: HTTPMethod {
        .get
    }

    var headers: [String: String]? {
        [
            "x-rapidapi-key": "cf4863382emsh660b0a010bd400dp1de074jsn26d3499ba6e2",
            "x-rapidapi-host": "bando-radio-api.p.rapidapi.com"
        ]
    }

    var queryParam: [String: String]? {
        [
            "offset": "0",
            "limit": "10"
        ]
    }

    var bodyParam: Data? {
        nil
    }

    private let keyword: String

    init(keyword: String) {
        self.keyword = keyword
    }
}
