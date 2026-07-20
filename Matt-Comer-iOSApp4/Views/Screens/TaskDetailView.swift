//
//  TaskDetailView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI



// Displays the full information for one selected mission.
struct TaskDetailView:View {
    // Watches the shared mission data.
    @ObservedObject var viewModel:TaskViewModel
    // Stores the selected mission.
    var task:Task
    // Displays the selected mission screen.
    var body:some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing:18) {
                    hero
                    detailsCard
                }
                .padding(.bottom,35)
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle("Mission")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.black,for:.navigationBar)
        .toolbarBackground(.visible,for:.navigationBar)
    }

    // Displays the selected mission image, logo, and title.
    private var hero:some View {
        ZStack(alignment:.bottomLeading) {
            Image(task.imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth:.infinity)
                .frame(height:240)
                .clipped()
            LinearGradient(
                colors:[
                    Color.black.opacity(0.08),
                    Color.black.opacity(0.92)
                ],
                startPoint:.top,
                endPoint:.bottom
            )
            // Displays the ForgeFlow logo in the top-left corner.
            VStack {
                HStack {
                    Image("ForgeFlow-Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:54,height:54)
                        .clipShape(RoundedRectangle(cornerRadius:10))
                        .overlay(
                            RoundedRectangle(cornerRadius:10)
                                .stroke(AppTheme.gold,lineWidth:1.2)
                        )
                    Spacer()
                }
                Spacer()
            }
            .padding(14)
            // Displays the selected mission title and category.
            VStack(alignment:.leading,spacing:7) {
                Text(task.title)
                    .font(.system(size:28,weight:.black))
                    .foregroundStyle(AppTheme.primary)
                    .lineLimit(2)
                Text(task.category.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(2)
                    .foregroundStyle(AppTheme.cyan)
            }
            .padding(.horizontal,20)
            .padding(.bottom,42)
        }
        .frame(height:240)
    }

    // Displays the mission information and actions.
    private var detailsCard:some View {
        VStack(alignment:.leading,spacing:18) {
            Text("MISSION DETAILS")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(AppTheme.primary)
            Text(task.description)
                .foregroundStyle(AppTheme.textSecondary)
                .fixedSize(horizontal:false,vertical:true)
            Divider()
                .overlay(Color.white.opacity(0.14))
            HStack {
                information(
                    title:"PRIORITY",
                    value:task.priority.uppercased(),
                    color:priorityColor
                )
                Spacer()
                information(
                    title:"STATUS",
                    value:task.isCompleted ? "COMPLETE":"ACTIVE",
                    color:task.isCompleted ? .green:AppTheme.primary
                )
            }
            actionButton(
                title:task.isCompleted ? "Reactivate Mission":"Complete Mission",
                icon:task.isCompleted ? "arrow.uturn.backward.circle.fill":"checkmark.circle.fill",
                color:AppTheme.cyan
            ) {
                viewModel.toggleCompleted(task:task)
            }
            actionButton(
                title:task.isFavourite ? "Remove Favourite":"Add to Favourites",
                icon:task.isFavourite ? "star.slash.fill":"star.fill",
                color:AppTheme.gold
            ) {
                viewModel.toggleFavourite(task:task)
            }
        }
        .padding(20)
        .background(AppTheme.panel.opacity(0.98))
        .overlay(
            RoundedRectangle(cornerRadius:22)
                .stroke(
                    AppTheme.gold.opacity(0.9),
                    lineWidth:1.4
                )
        )
        .clipShape(RoundedRectangle(cornerRadius:22))
        .shadow(
            color:AppTheme.primary.opacity(0.22),
            radius:12,
            y:4
        )
        .padding(.horizontal,18)
    }

    // Displays one mission information value.
    private func information(title:String,value:String,color:Color)->some View {
        VStack(alignment:.leading,spacing:5) {
            Text(title)
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundStyle(AppTheme.textSecondary)
            Text(value)
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(color)
        }
    }

    // Creates one full-width mission action button.
    private func actionButton(title:String,icon:String,color:Color,action:@escaping()->Void)->some View {
        Button(action:action) {
            HStack {
                Image(systemName:icon)
                Text(title)
                    .fontWeight(.bold)
                Spacer()
            }
            .foregroundStyle(color)
            .padding(14)
            .background(Color.black.opacity(0.50))
            .overlay(
                RoundedRectangle(cornerRadius:14)
                    .stroke(
                        color.opacity(0.85),
                        lineWidth:1.1
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius:14))
        }
        .buttonStyle(.plain)
    }

    // Selects the colour used for the mission priority.
    private var priorityColor:Color {
        switch task.priority.lowercased() {
        case "high":
            return AppTheme.danger
        case "medium":
            return AppTheme.primary
        default:
            return AppTheme.cyan
        }
    }
}

// Displays a preview of the selected mission screen.
#Preview {
    NavigationStack {
        TaskDetailView(
            viewModel:TaskViewModel(),
            task:SampleDataService.sampleTasks[0]
        )
    }
}
