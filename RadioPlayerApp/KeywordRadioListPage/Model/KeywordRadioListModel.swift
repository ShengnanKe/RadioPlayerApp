//
//  KeywordRadioListModel.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation

class KeywordRadioListModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchResults: [RadioKeywordInfo] = []
    let keyword: String

    init(keyword: String) {
        self.keyword = keyword
    }
}
