//
//  MainTabView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-09.
//

import SwiftUI

// Creates the main tab navigation for ForgeFlow.
struct MainTabView: View {
    // Creates one shared mission view model for every tab.
    @StateObject private var viewModel = TaskViewModel()

    var body: some View {
        TabView {
            DashboardView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Dashboard")
                }
            NavigationStack {
                TaskListView(viewModel: viewModel)
            }
            .tabItem {
                Image(systemName: "checklist")
                Text("Missions")
            }
            NavigationStack {
                FavouriteTasksView(viewModel: viewModel)
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Favourites")
            }
            .badge(viewModel.favouriteTasks.count)
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .tint(AppTheme.primary)
        .toolbarBackground(Color(red: 0.035,green: 0.025,blue: 0.045),for: .tabBar)
        .toolbarBackground(.visible,for: .tabBar)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainTabView()
}
