//
//  Matt_Comer_iOSApp4App.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-09.
//

import SwiftUI
import FirebaseCore

// Main entry point for the app.
@main
struct Matt_Comer_iOSApp4App: App {

    // Connects Firebase when the app starts.
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
