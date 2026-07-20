//
//  ContentView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-09.
//

import SwiftUI


// Controls whether the user sees the login screen or the ForgeFlow app.
struct ContentView:View {
    // Creates and stores the authentication view model.
    @StateObject private var authViewModel=AuthViewModel()
    var body:some View {
        // Displays the correct screen based on the user's login status.
        if authViewModel.isLoggedIn {
            MainTabView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
