//
//  KeywordSearchModel.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation

class KeywordSearchModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchResults: [RadioKeywordInfo] = []
    @Published var searchKeyword: String = ""
}
