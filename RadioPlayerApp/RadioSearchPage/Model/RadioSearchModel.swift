//
//  RadioSearchModel.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/10/24.
//

import Foundation

class RadioSearchModel: ObservableObject{
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchResults: [RadioCountryInfo] = []
    @Published var searchCountry: String = ""
    
    //var hasLoaded: Bool = false
    
}
