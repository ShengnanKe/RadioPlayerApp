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


//
//class RadioSearchIntent: ObservableObject {
//    @Published private var model: RadioSearchModel
//    private var cancellables = Set<AnyCancellable>()
//
//    init(model: RadioSearchModel) {
//        self.model = model
//    }
//
//    func fetchCountryRadioList(for country: String) {
//        guard !model.isLoading else { return }
//        
//        model.isLoading = true
//        model.errorMessage = nil
//        
//        let request = RadioCountryRequest(country: country)
//        
//        HttpClient().fetchData(from: request)
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion {
//                case .failure(let error):
//                    self.model.errorMessage = error.localizedDescription
//                    self.model.isLoading = false
//                case .finished:
//                    break
//                }
//            } receiveValue: { (stations: [RadioInfo]) in
//                self.model.searchResults = stations
//                self.model.isLoading = false
//            }
//            .store(in: &cancellables)
//    }
//}
