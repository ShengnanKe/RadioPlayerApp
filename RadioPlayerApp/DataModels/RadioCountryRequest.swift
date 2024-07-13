//
//  RadioCountryRequest.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/12/24.
//

/*
 curl --request GET \
     --url 'https://bando-radio-api.p.rapidapi.com/stations/bycountry/Austria?hidebroken=true&offset=0&limit=10' \
     --header 'x-rapidapi-host: bando-radio-api.p.rapidapi.com' \
     --header 'x-rapidapi-key: cf4863382emsh660b0a010bd400dp1de074jsn26d3499ba6e2'
 */

import Foundation

struct RadioCountryRequest: RequestBuilder {
    
    private let country: String
    
    var baseUrl: String {
        "https://bando-radio-api.p.rapidapi.com"
    }

    var path: String? {
        "/stations/bycountry/\(country)"
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
            "hidebroken": "true",
            "offset": "0",
            "limit": "10"
        ]
    }
    
    var bodyParam: Data? {
        nil
    }

    init(country: String) {
        self.country = country
    }
}
