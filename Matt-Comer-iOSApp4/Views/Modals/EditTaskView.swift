//
//  EditTaskView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI

// Allows the user to edit an existing mission.
struct EditTaskView:View {
// Stores the mission being edited.
    @Binding var task:Task
// Stores the available priority choices.
    private let priorities=["Low","Medium","High"]
// Displays the Edit Mission screen interface.
    var body:some View {
    // Creates the Edit Mission navigation screen.
        NavigationStack {
        // Displays the editable mission information.
            Form {
            // Displays the mission information section.
                Section("MISSION DETAILS") {
                // Allows the user to edit the mission title.
                    TextField("Mission title",text:$task.title)
                // Allows the user to edit the mission description.
                    TextField("Description",text:$task.description,axis:.vertical)
                        .lineLimit(3...5)
                // Allows the user to edit the mission category.
                    TextField("Category",text:$task.category)
                // Allows the user to change the mission priority.
                    Picker("Priority",selection:$task.priority) {
                    // Displays each priority option.
                        ForEach(priorities,id:\.self) { level in
                            Text(level)
                        }
                    }
                }
            // Displays the mission status section.
                Section("MISSION STATUS") {
                    // Marks the mission as completed.
                    Toggle("Completed",isOn:$task.isCompleted)
                    // Marks the mission as a favourite.
                    Toggle("Favourite",isOn:$task.isFavourite)
                }
            }
            // Displays the screen title.
            .navigationTitle("Edit Mission")
        }
    }
}

// Displays a preview of the Edit Mission screen.
#Preview {
    // Creates navigation for the preview.
    NavigationStack {
        // Displays the Edit Mission screen preview.
        EditTaskView(
            task:.constant(
                Task(
                    title:"Assignment 7",
                    description:"Complete the SwiftUI project.",
                    category:"School",
                    priority:"High",
                    imageName:"ForgeFlow-splashscreen-V11",
                    isCompleted:false,
                    isFavourite:true
                )
            )
        )
    }
}
