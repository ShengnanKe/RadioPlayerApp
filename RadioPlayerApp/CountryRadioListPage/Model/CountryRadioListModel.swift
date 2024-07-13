//
//  CountryRadioListModel.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation

class CountryRadioListModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchResults: [RadioCountryInfo] = []
    let country: String
    
    init(country: String) {
        self.country = country
        
    }
}
