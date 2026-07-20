//
//  DashboardView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI



// Displays the main ForgeFlow dashboard.
struct DashboardView:View {
// Watches the shared mission data.
    @ObservedObject var viewModel:TaskViewModel
// Controls the Add Mission sheet.
    @State private var showingAddTask=false
// Creates the main ForgeFlow dashboard interface.
    var body:some View {
    // Creates navigation for the dashboard.
        NavigationStack {
 // Places the dashboard content vertically.
            VStack(spacing:0) {
            // Displays the ForgeFlow dashboard header.
                SectionHeaderView(
                    imageName:"ForgeFlow-splashscreen-V13",
                    title:"ForgeFlow Dashboard",
                    subtitle:"Build • Create • Deploy"
                )
                // Displays the active mission heading and Add Mission button.
                HStack {
                    // Places the mission heading and count vertically.
                    VStack(alignment:.leading,spacing:4) {
                        // Displays the active mission heading.
                        Text("ACTIVE MISSIONS")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(AppTheme.primary)
                        // Displays the number of incomplete missions.
                        Text("\(activeMissionCount) missions remaining")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    // Pushes the Add Mission button to the right.
                    Spacer()
                    // Opens the Add Mission screen.
                    Button {
                        showingAddTask=true
                    } label: {
                        // Displays the Add Mission symbol.
                        Image(systemName:"plus")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(AppTheme.primary)
                }
                .padding()
                // Displays all filtered missions.
                List {
                    // Loops through the filtered missions.
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
            // Displays the Add Mission screen as a sheet.
            .sheet(isPresented:$showingAddTask) {
                // Passes the shared mission data into AddTaskView.
                AddTaskView(viewModel:viewModel)
            }
        }
    }
    // Returns the number of incomplete missions.
    private var activeMissionCount:Int {
        viewModel.tasks.filter { !$0.isCompleted }.count
    }
}

// Displays a preview of the ForgeFlow dashboard.
#Preview {
    // Creates the dashboard with sample mission data.
    DashboardView(viewModel:TaskViewModel())
}
