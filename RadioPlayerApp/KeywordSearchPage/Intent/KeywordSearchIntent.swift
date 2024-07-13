//
//  KeywordSearchIntent.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation
import Combine

class KeywordSearchIntent: ObservableObject {
    @Published private var model: KeywordSearchModel
    private var cancellables = Set<AnyCancellable>()

    init(model: KeywordSearchModel) {
        self.model = model
    }

    func fetchKeywordRadioList(for keyword: String) {
        guard !model.isLoading else { return }

        model.isLoading = true
        model.errorMessage = nil

        let request = RadioKeywordRequest(keyword: keyword)

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
            } receiveValue: { (stations: [RadioKeywordInfo]) in
                self.model.searchResults = stations
                self.model.isLoading = false
            }
            .store(in: &cancellables)
    }
}
