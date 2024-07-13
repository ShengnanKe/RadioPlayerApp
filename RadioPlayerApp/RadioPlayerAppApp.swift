//
//  RadioPlayerAppApp.swift
//  RadioPlayerApp
//
//  Created by KKNANXX on 7/9/24.
//

import SwiftUI

@main
struct RadioPlayerAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomePage()
            //ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
