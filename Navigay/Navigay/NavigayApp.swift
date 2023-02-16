//
//  NavigayApp.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import SwiftUI

@main
struct NavigayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
