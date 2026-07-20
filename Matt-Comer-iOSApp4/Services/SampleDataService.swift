//
//  SampleDataService.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import Foundation

// This class stores the sample missions displayed throughout ForgeFlow.
class SampleDataService {

    // Creates the sample missions used by the application.
    static let sampleTasks: [Task] = [

        // Creates the first mission.
        Task(
            title: "Launch ForgeFlow",
            description: "Complete the core dashboard, finish the navigation, and prepare the application for deployment.",
            category: "Development",
            priority: "High",
            imageName: "ForgeFlow-splashscreen-V11",
            isCompleted: false,
            isFavourite: false
        ),

        // Creates the second mission.
        Task(
            title: "Refine User Experience",
            description: "Improve the layout, animations, spacing, colours, and overall visual experience.",
            category: "Design",
            priority: "Medium",
            imageName: "ForgeFlow-splashscreen-V12",
            isCompleted: false,
            isFavourite: false
        ),

        // Creates the third mission.
        Task(
            title: "Build Backend Services",
            description: "Connect Firebase, validate stored data, and complete the remaining application features.",
            category: "Development",
            priority: "High",
            imageName: "ForgeFlow-splashscreen-V13",
            isCompleted: false,
            isFavourite: true
        ),

        // Creates the fourth mission.
        Task(
            title: "Quality Assurance",
            description: "Test every screen, remove bugs, improve performance, and verify the final submission.",
            category: "Testing",
            priority: "Medium",
            imageName: "ForgeFlow-splashscreen-V10",
            isCompleted: false,
            isFavourite: false
        ),

        // Creates the fifth mission.
        Task(
            title: "Deploy Application",
            description: "Complete the final review, package the project, and prepare ForgeFlow for release.",
            category: "Deployment",
            priority: "Low",
            imageName: "ForgeFlow-splashscreen-V8",
            isCompleted: false,
            isFavourite: false
        )

    ]

}
