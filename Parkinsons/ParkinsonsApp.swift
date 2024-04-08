//
//  ParkinsonsApp.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import SwiftUI

@main
struct ParkinsonsApp: App {
    // Create an instance of AppState to share across views
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView(appState: appState)
                .preferredColorScheme(.dark)
        }
    }
}



