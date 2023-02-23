//
//  NavigayApp.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import SwiftUI

@main
struct NavigayApp: App {
    
    @StateObject var coreDataManager = CoreDataManager()
    @StateObject var userViewModel = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            EntryView(isUserLoggenIn: $coreDataManager.isUserLoggedIn)
        }
    }
}
