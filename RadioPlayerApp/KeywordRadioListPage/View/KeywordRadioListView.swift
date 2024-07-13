//
//  KeywordRadioListView.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//
import SwiftUI

struct KeywordRadioListView: View {
    @StateObject private var container: MVIContainer<KeywordRadioListIntent, KeywordRadioListModel>
    @State private var selectedRadio: RadioKeywordInfo?

    init(keyword: String) {
        let model = KeywordRadioListModel(keyword: keyword)
        let intent = KeywordRadioListIntent(model: model)
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
        .navigationTitle("Keyword Radio List")
        .onAppear {
            container.intent.fetchKeywordRadioList()
        }
    }
}
