//
//  KeywordSearchModel.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation
import Combine

class KeywordSearchModel: ObservableObject {
    @Published var searchKeyword: String = ""
}

