//
//  TaskViewModel.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI
import Foundation
import Combine

// This class manages all task data used throughout the ForgeFlow app.
class TaskViewModel:ObservableObject {
    // Stores every task displayed within the application.
    @Published var tasks:[Task]=SampleDataService.sampleTasks
    // Stores the text entered into the search bar.
    @Published var searchText:String=""
    // Returns only the tasks that match the user's search.
    var filteredTasks:[Task] {
        // Returns every task when the search is empty.
        if searchText.isEmpty {
            return tasks
        } else {
            // Returns tasks that match the title or category.
            return tasks.filter { task in
                task.title.lowercased().contains(searchText.lowercased()) ||
                task.category.lowercased().contains(searchText.lowercased())
            }
        }
    }
    // Returns only the tasks marked as favourites.
    var favouriteTasks:[Task] {
        // Returns every favourite task.
        tasks.filter {
            $0.isFavourite
        }
    }
    // Creates and adds a new task to the task list.
    func addTask(
        title:String,
        description:String,
        category:String,
        priority:String
    ) {
        // Creates a new task using the default ForgeFlow artwork.
        let newTask=Task(
            title:title,
            description:description,
            category:category,
            priority:priority,
            imageName:"ForgeFlow-splashscreen-V11",
            isCompleted:false,
            isFavourite:false
        )
        // Adds the new task to the main task list.
        tasks.append(newTask)
    }
    // Toggles a task between completed and incomplete.
    func toggleCompleted(task:Task) {
        // Finds the selected task.
        if let index=tasks.firstIndex(where:{
            $0.id==task.id
        }) {
            // Updates the completed status.
            tasks[index].isCompleted.toggle()
        }
    }
    // Toggles a task between favourite and not favourite.
    func toggleFavourite(task:Task) {
        // Finds the selected task.
        if let index=tasks.firstIndex(where:{
            $0.id==task.id
        }) {
            // Updates the favourite status.
            tasks[index].isFavourite.toggle()
        }
    }
}
