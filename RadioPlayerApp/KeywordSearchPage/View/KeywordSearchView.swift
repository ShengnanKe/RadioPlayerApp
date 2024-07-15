//
//  KeywordSearchView.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/13/24.
//

import SwiftUI

struct KeywordSearchView: View {
    @StateObject private var container: MVIContainer<KeywordSearchIntent, KeywordSearchModel>
    @State private var isSearching = false

    init() {
        let model = KeywordSearchModel()
        let intent = KeywordSearchIntent(model: model)
        _container = StateObject(wrappedValue: MVIContainer(intent: intent, model: model, modelChangePublisher: model.objectWillChange))
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Search by keyword ...", text: $container.model.searchKeyword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        isSearching = true
                    }) {
                        Text("Search")
                    }
                }
                .padding()

                NavigationLink(
                    destination: KeywordRadioListView(keyword: container.model.searchKeyword),
                    isActive: $isSearching
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Keyword Search Page")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
