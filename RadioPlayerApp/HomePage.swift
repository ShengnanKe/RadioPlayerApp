//
//  HomePage.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/9/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        TabView{
            
            RadioSearchView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Country Radio Search")
                }
            
            KeywordSearchView()
                .tabItem {
                    Image(systemName: "radio")
                    Text("Keyword Radio Search")
                }
        }
    }
}

#Preview {
    HomePage()
}
