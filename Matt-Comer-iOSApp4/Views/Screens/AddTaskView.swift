//
//  AddTaskView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI

// Lets the user create a new ForgeFlow mission.
struct AddTaskView: View {
    // Watches the shared mission data.
    @ObservedObject var viewModel: TaskViewModel
    // Closes the sheet after saving or cancelling.
    @Environment(\.dismiss) private var dismiss
    // Stores the form values entered by the user.
    @State private var title = ""
    @State private var description = ""
    @State private var category = ""
    @State private var priority = "Medium"
    // Stores the available priority choices.
    private let priorities = ["Low","Medium","High"]

    var body: some View {
        NavigationStack {
            ZStack {
                Image("FlowForge-splashscreen-V5")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.18)
                Color.black
                    .opacity(0.82)
                    .ignoresSafeArea()
                Form {
                    Section("MISSION INFORMATION") {
                        TextField("Title",text: $title)
                        TextField("Description",text: $description,axis: .vertical)
                            .lineLimit(3...5)
                        TextField("Category",text: $category)
                        Picker("Priority",selection: $priority) {
                            ForEach(priorities,id: \.self) { level in
                                Text(level)
                            }
                        }
                    }
                    .listRowBackground(AppTheme.panel.opacity(0.96))
                }
                .scrollContentBackground(.hidden)
                .foregroundStyle(.white)
                .tint(AppTheme.primary)
            }
            .navigationTitle("Add Mission")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.black,for: .navigationBar)
            .toolbarBackground(.visible,for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(AppTheme.textSecondary)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        viewModel.addTask(
                            title: title,
                            description: description,
                            category: category,
                            priority: priority
                        )
                        dismiss()
                    }
                    .fontWeight(.bold)
                    .foregroundStyle(AppTheme.primary)
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    AddTaskView(viewModel: TaskViewModel())
}
