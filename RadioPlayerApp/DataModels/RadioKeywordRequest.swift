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
            "x-rapidapi-key": "7570b46af4mshaf70502c1dc6726p1cd091jsn8786f55668db",
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
