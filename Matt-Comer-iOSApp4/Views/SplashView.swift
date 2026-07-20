
//
//  SplashView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-09.
//

import SwiftUI

// This view displays the ForgeFlow splash screen when the app launches.
struct SplashView: View {

    var body: some View {

        ZStack {

            // Creates the matte black splash screen background.
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 24) {

                // Displays the main ForgeFlow splash image.
                Image("ForgeFlow-splashscreen-V9")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 20)

                // Displays the ForgeFlow app title.
                Text("FORGEFLOW")
                    .font(
                        .system(
                            size: 38,
                            weight: .black
                        )
                    )
                    .foregroundColor(
                        Color(
                            red: 0.85,
                            green: 0.20,
                            blue: 1.00
                        )
                    )
                    .shadow(
                        color: .purple.opacity(0.90),
                        radius: 10
                    )

                // Displays the ForgeFlow slogan below the title.
                Text("BUILD • CREATE • DEPLOY")
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(3)
                    .foregroundColor(.white.opacity(0.80))

            }

        }

    }

}

// Displays a preview of the splash screen inside Xcode.
#Preview {

    SplashView()

}
