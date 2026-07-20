//
//  TaskCardView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI


// Displays one ForgeFlow mission card.
struct TaskCardView:View {
    // Stores the task displayed inside this card.
    var task:Task
    // Displays the mission card interface.
    var body:some View {
        // Places the logo and mission information horizontally.
        HStack(alignment:.center,spacing:12) {
            // Displays the ForgeFlow logo.
            Image("ForgeFlow-Logo")
                .resizable()
                .scaledToFit()
                .frame(width:50,height:50)
                .clipShape(RoundedRectangle(cornerRadius:10))
            // Places the mission information vertically.
            VStack(alignment:.leading,spacing:5) {
                // Displays the mission title.
                Text(task.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(AppTheme.primary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)
                // Displays the mission description.
                Text(task.description)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.textSecondary)
                    .lineLimit(2)
                    .fixedSize(horizontal:false,vertical:true)
                // Displays the mission category, priority, and status.
                HStack(spacing:9) {
                    // Displays the mission category.
                    Text(task.category)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(AppTheme.cyan)
                        .lineLimit(1)
                    // Displays the mission priority.
                    Text(task.priority)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(priorityColor)
                        .lineLimit(1)
                    // Displays the mission completion status.
                    Text(task.isCompleted ? "Complete":"Active")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(
                            task.isCompleted ? Color.green:AppTheme.primary
                        )
                        .lineLimit(1)
                }
            }
            .frame(maxWidth:.infinity,alignment:.leading)
            // Displays the favourite icon when selected.
            if task.isFavourite {
                Image(systemName:"star.fill")
                    .font(.title3)
                    .foregroundStyle(AppTheme.gold)
            }
        }
        // Adds spacing inside the mission card.
        .padding(14)
        // Displays the mission card background.
        .background(AppTheme.panel.opacity(0.98))
        // Rounds the mission card corners.
        .clipShape(RoundedRectangle(cornerRadius:18))
        // Adds the metallic gold border.
        .overlay(
            RoundedRectangle(cornerRadius:18)
                .stroke(
                    AppTheme.gold.opacity(0.90),
                    lineWidth:1.3
                )
        )
        // Adds the ForgeFlow glow.
        .shadow(
            color:AppTheme.primary.opacity(0.20),
            radius:10,
            y:3
        )
        // Allows the mission card to fill the available width.
        .frame(maxWidth:.infinity,alignment:.leading)
        // Adds spacing around the mission card.
        .padding(.horizontal,4)
        .padding(.vertical,2)
    }
    // Selects the mission priority colour.
    private var priorityColor:Color {
        // Checks the mission priority.
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

// Displays a preview of the mission card.
#Preview {
    TaskCardView(task:SampleDataService.sampleTasks[0])
        .padding()
        .background(Color.black)
}
