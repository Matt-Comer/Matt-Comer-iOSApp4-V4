//
//  TaskListView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI


// Displays every ForgeFlow mission.
struct TaskListView:View {
    // Watches the shared mission data.
    @ObservedObject var viewModel:TaskViewModel
    // Displays the mission list interface.
    var body:some View {
        // Creates navigation for the mission screen.
        NavigationStack {
            // Places the mission content vertically.
            VStack(spacing:0) {
                // Displays the branded Missions header.
                SectionHeaderView(
                    imageName:"FlowForge-splashscreen-V4",
                    title:"Missions",
                    subtitle:"Build • Create • Deploy"
                )
                // Displays the mission search field.
                HStack(spacing:10) {
                    // Displays the search icon.
                    Image(systemName:"magnifyingglass")
                        .foregroundStyle(AppTheme.textSecondary)
                    // Allows the user to search missions.
                    TextField("Search missions",text:$viewModel.searchText)
                        .foregroundStyle(.white)
                    // Clears the mission search.
                    if !viewModel.searchText.isEmpty {
                        Button {
                            viewModel.searchText=""
                        } label: {
                            Image(systemName:"xmark.circle.fill")
                                .foregroundStyle(AppTheme.textSecondary)
                        }
                    }
                }
                .padding(.horizontal,16)
                .frame(height:50)
                .background(AppTheme.panel)
                .clipShape(RoundedRectangle(cornerRadius:14))
                .overlay(
                    RoundedRectangle(cornerRadius:14)
                        .stroke(
                            AppTheme.primary.opacity(0.45),
                            lineWidth:1
                        )
                )
                .padding()
                // Displays every matching mission.
                List {
                    // Loops through every filtered mission.
                    ForEach(viewModel.filteredTasks) { task in
                        // Opens the selected mission details.
                        NavigationLink {
                            // Displays the selected mission details.
                            TaskDetailView(
                                viewModel:viewModel,
                                task:task
                            )
                        } label: {
                            // Displays one reusable mission card.
                            TaskCardView(task:task)
                        }
                        .listRowBackground(AppTheme.background)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(AppTheme.background)
            }
            .background(AppTheme.background)
        }
        .tint(AppTheme.primary)
    }
}

// Displays a preview of the mission list.
#Preview {
    TaskListView(viewModel:TaskViewModel())
}
