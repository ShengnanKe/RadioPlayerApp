//
//  CountryRadioListIntent.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import Foundation
import Combine

class CountryRadioListIntent: ObservableObject {
    @Published private var model: CountryRadioListModel
    private var cancellables = Set<AnyCancellable>()

    init(model: CountryRadioListModel) {
        self.model = model
    }

    func fetchCountryRadioList() {
        guard !model.isLoading else { return }

        model.isLoading = true
        model.errorMessage = nil

        let request = RadioCountryRequest(country: model.country)

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
            } receiveValue: { (stations: [RadioCountryInfo]) in
                self.model.searchResults = stations
                self.model.isLoading = false
            }
            .store(in: &cancellables)
    }
}
