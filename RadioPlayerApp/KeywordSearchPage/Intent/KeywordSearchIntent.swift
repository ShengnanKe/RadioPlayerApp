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

    init(model: KeywordSearchModel) {
        self.model = model
    }
}



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
