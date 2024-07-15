//
//  RadioSearchView.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/9/24.
//

import SwiftUI
import Combine

struct RadioSearchView: View {
    @StateObject private var container: MVIContainer<RadioSearchIntent, RadioSearchModel>
    @State private var isSearching = false

    init() {
        let model = RadioSearchModel()
        let intent = RadioSearchIntent(model: model)
        _container = StateObject(wrappedValue: MVIContainer(intent: intent, model: model, modelChangePublisher: model.objectWillChange))
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Search for country ...", text: $container.model.searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        isSearching = true
                    }) {
                        Text("Search")
                    }
                }
                .padding()

                NavigationLink(
                    destination: CountryRadioListView(country: container.model.searchQuery),
                    isActive: $isSearching
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Radio Search Page")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}






//
//struct RadioSearchView: View {
//    @StateObject private var container: MVIContainer<RadioSearchIntent, RadioSearchModel>
//    @State private var isSearching = false
//
//    init() {
//        let model = RadioSearchModel()
//        let intent = RadioSearchIntent(model: model)
//        _container = StateObject(wrappedValue: MVIContainer(intent: intent, model: model, modelChangePublisher: model.objectWillChange))
//    }
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                HStack {
//                    TextField("Search for country ...", text: $container.model.searchCountry)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Button(action: {
//                        isSearching = true
//                        container.intent.fetchCountryRadioList(for: container.model.searchCountry)
//                    }) {
//                        Text("Search")
//                    }
//                }
//                .padding()
//
//                NavigationLink(
//                    destination: CountryRadioListView(country: container.model.searchCountry),
//                    isActive: $isSearching
//                ) {
//                    EmptyView()
//                }
//            }
//            .navigationTitle("Radio Search Page")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//
