//
//  SettingsView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//



import SwiftUI

// Allows the user to customize ForgeFlow settings.
struct SettingsView:View {
    // Controls whether notifications are enabled.
    @State private var notificationsEnabled=true
    // Controls whether dark mode is enabled.
    @State private var darkModeEnabled=true
    // Displays the Settings screen interface.
    var body:some View {
        // Places the Settings content vertically.
        VStack(spacing:0) {
            // Displays the branded Settings header.
            SectionHeaderView(
                imageName:"FlowForge-splashscreen-V6",
                title:"Settings",
                subtitle:"Customize your ForgeFlow experience"
            )
            // Allows the Settings sections to scroll.
            ScrollView {
                // Places every Settings section vertically.
                VStack(spacing:18) {
                    // Displays the Appearance section.
                    VStack(alignment:.leading,spacing:10) {
                        // Displays the Appearance heading.
                        Text("APPEARANCE")
                            .font(.caption)
                            .fontWeight(.black)
                            .tracking(1.5)
                            .foregroundStyle(AppTheme.primary)
                        // Displays the Appearance controls.
                        VStack(spacing:14) {
                            // Controls dark mode.
                            Toggle("Dark Mode",isOn:$darkModeEnabled)
                                .tint(AppTheme.primary)
                        }
                        .foregroundStyle(.white)
                        .padding(16)
                        .frame(maxWidth:.infinity)
                        .background(AppTheme.panel)
                        .clipShape(RoundedRectangle(cornerRadius:20))
                        .overlay(
                            RoundedRectangle(cornerRadius:20)
                                .stroke(
                                    AppTheme.gold.opacity(0.85),
                                    lineWidth:1.3
                                )
                        )
                    }
                    // Displays the Notification section.
                    VStack(alignment:.leading,spacing:10) {
                        // Displays the Notification heading.
                        Text("NOTIFICATIONS")
                            .font(.caption)
                            .fontWeight(.black)
                            .tracking(1.5)
                            .foregroundStyle(AppTheme.primary)
                        // Displays the Notification controls.
                        VStack(spacing:14) {
                            // Controls ForgeFlow notifications.
                            Toggle(
                                "Enable Notifications",
                                isOn:$notificationsEnabled
                            )
                            .tint(AppTheme.primary)
                        }
                        .foregroundStyle(.white)
                        .padding(16)
                        .frame(maxWidth:.infinity)
                        .background(AppTheme.panel)
                        .clipShape(RoundedRectangle(cornerRadius:20))
                        .overlay(
                            RoundedRectangle(cornerRadius:20)
                                .stroke(
                                    AppTheme.gold.opacity(0.85),
                                    lineWidth:1.3
                                )
                        )
                    }
                    // Displays the About section.
                    VStack(alignment:.leading,spacing:10) {
                        // Displays the About heading.
                        Text("ABOUT")
                            .font(.caption)
                            .fontWeight(.black)
                            .tracking(1.5)
                            .foregroundStyle(AppTheme.primary)
                        // Displays the application information.
                        VStack(spacing:14) {
                            // Displays the application name.
                            HStack {
                                Text("Application")
                                Spacer()
                                Text("ForgeFlow")
                                    .foregroundStyle(AppTheme.textSecondary)
                            }
                            // Separates the application information.
                            Divider()
                                .overlay(Color.white.opacity(0.12))
                            // Displays the application version.
                            HStack {
                                Text("Version")
                                Spacer()
                                Text("1.0")
                                    .foregroundStyle(AppTheme.textSecondary)
                            }
                        }
                        .foregroundStyle(.white)
                        .padding(16)
                        .frame(maxWidth:.infinity)
                        .background(AppTheme.panel)
                        .clipShape(RoundedRectangle(cornerRadius:20))
                        .overlay(
                            RoundedRectangle(cornerRadius:20)
                                .stroke(
                                    AppTheme.gold.opacity(0.85),
                                    lineWidth:1.3
                                )
                        )
                    }
                }
                .padding(18)
                .padding(.bottom,100)
            }
            .scrollIndicators(.hidden)
            .background(AppTheme.background)
        }
        .background(AppTheme.background)
        .preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
}

// Displays a preview of the Settings screen.
#Preview {
    SettingsView()
}
