//
//  RadioSearchIntent.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/10/24.
//

import Foundation
import Combine

class RadioSearchIntent: ObservableObject {
    @Published private var model: RadioSearchModel
    private var cancellables = Set<AnyCancellable>()

    init(model: RadioSearchModel) {
        self.model = model
    }

    // No need for fetchCountryRadioList method here
}


