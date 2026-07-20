//
//  Task.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import Foundation

// This structure represents one task in the ForgeFlow app.
struct Task: Identifiable {

    // Creates a unique ID for each task.
    let id = UUID()

    // Stores the task title.
    var title: String

    // Stores the task description.
    var description: String

    // Stores the task category.
    var category: String

    // Stores the task priority.
    var priority: String

    // Stores the image name from Assets.
    var imageName: String

    // Tracks whether the task is complete.
    var isCompleted: Bool

    // Tracks whether the task is a favourite.
    var isFavourite: Bool
}
