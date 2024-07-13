//
//  CountryRadioListView.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import SwiftUI

struct CountryRadioListView: View {
    @StateObject private var container: MVIContainer<CountryRadioListIntent, CountryRadioListModel>
    @State private var selectedRadio: RadioInfo?

    init(country: String) {
        let model = CountryRadioListModel(country: country)
        let intent = CountryRadioListIntent(model: model)
        _container = StateObject(wrappedValue: MVIContainer(intent: intent, model: model, modelChangePublisher: model.objectWillChange))
    }

    var body: some View {
        List(container.model.searchResults, id: \.self) { radio in
            NavigationLink(destination: RadioPlayerView(radio: radio), tag: radio, selection: $selectedRadio) {
                VStack(alignment: .leading) {
                    Text(radio.name)
                        .font(.headline)
                    Text(radio.url)
                        .font(.subheadline)
                    Text(radio.urlResolved)
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("Country Radio List")
        .onAppear {
            container.intent.fetchCountryRadioList()
        }
    }
}
