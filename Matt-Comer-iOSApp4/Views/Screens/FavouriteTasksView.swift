//
//  FavouriteTasksView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI


// Displays missions marked as favourites.
struct FavouriteTasksView:View {
    // Watches the shared mission data.
    @ObservedObject var viewModel:TaskViewModel
    // Creates the Favourite Tasks screen interface.
    var body:some View {
        // Creates navigation for the Favourite Tasks screen.
        NavigationStack {
            // Places the Favourite Tasks content vertically.
            VStack(spacing:0) {
                // Displays the branded Favourite Tasks page header.
                SectionHeaderView(
                    imageName:"ForgeFlow-splashscreen-V12",
                    title:"Favourite Tasks",
                    subtitle:"Priority missions saved for quick access"
                )
                // Checks whether any favourite missions exist.
                if viewModel.favouriteTasks.isEmpty {
                    // Displays the empty favourites message.
                    VStack(spacing:12) {
                        // Displays the empty favourites icon.
                        Image(systemName:"star.slash")
                            .font(.system(size:38,weight:.bold))
                            .foregroundStyle(AppTheme.primary)
                        // Displays the empty favourites title.
                        Text("NO FAVOURITES YET")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundStyle(AppTheme.primary)
                        // Explains how to add missions to favourites.
                        Text("Mark a mission as a favourite to display it here.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                    }
                    // Allows the empty state to fill the available space.
                    .frame(maxWidth:.infinity,maxHeight:.infinity)
                } else {
                    // Displays the favourite missions.
                    List {
                        // Creates one row for every favourite mission.
                        ForEach(viewModel.favouriteTasks) { task in
                            // Opens the selected mission detail screen.
                            NavigationLink {
                                // Displays the selected mission details.
                                TaskDetailView(viewModel:viewModel,task:task)
                            } label: {
                                // Displays the selected favourite mission.
                                TaskCardView(task:task)
                            }
                            .listRowBackground(AppTheme.background)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(AppTheme.background)
                }
            }
            .background(AppTheme.background)
        }
    }
}

// Displays a preview of the Favourite Tasks screen.
#Preview {
    // Creates navigation for the preview.
    NavigationStack {
        // Displays the Favourite Tasks screen preview.
        FavouriteTasksView(viewModel:TaskViewModel())
    }
}
