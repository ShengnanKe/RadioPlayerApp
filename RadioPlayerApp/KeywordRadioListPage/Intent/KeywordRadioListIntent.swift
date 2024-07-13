//
//  KeywordRadioListIntent.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation
import Combine

class KeywordRadioListIntent: ObservableObject {
    @Published private var model: KeywordRadioListModel
    private var cancellables = Set<AnyCancellable>()

    init(model: KeywordRadioListModel) {
        self.model = model
    }

    func fetchKeywordRadioList() {
        guard !model.isLoading else { return }

        model.isLoading = true
        model.errorMessage = nil

        let request = RadioKeywordRequest(keyword: model.keyword)

        HttpClient().fetchData(from: request)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.model.errorMessage = error.localizedDescription
                    self.model.isLoading = false
                case .finished:
                    break
                }
            } receiveValue: { (stations: [RadioInfo]) in
                self.model.searchResults = stations
                self.model.isLoading = false
            }
            .store(in: &cancellables)
    }
}
