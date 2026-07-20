//
//  SectionHeaderView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

//
//  SectionHeaderView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI

// Displays one reusable ForgeFlow page header.
struct SectionHeaderView: View {
    // Stores the current background image name.
    var imageName: String
    // Stores the main header title.
    var title: String
    // Stores the smaller header subtitle.
    var subtitle: String
    // Creates the reusable page header interface.
    var body: some View {
        // Places the header image, logo, title, and subtitle together.
        ZStack {
            // Displays the background image selected by the current screen.
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 190)
                .frame(maxWidth: .infinity)
                .clipped()
            // Adds one dark overlay over the header image.
            Color.black
                .opacity(0.45)
            // Places the title and subtitle in the center.
            VStack(spacing: 4) {
                // Displays the centered page title.
                Text(title.uppercased())
                    .font(.system(size: 25,weight: .black))
                    .foregroundStyle(AppTheme.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
                    .shadow(color: .black,radius: 3)
                // Displays the centered page subtitle.
                Text(subtitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .minimumScaleFactor(0.80)
            }
            .padding(.horizontal,70)
            // Places the ForgeFlow logo in the top-left corner.
            VStack {
                HStack {
                    // Displays the ForgeFlow logo.
                    Image("ForgeFlow-Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52,height: 52)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(AppTheme.gold,lineWidth: 1)
                        )
                    Spacer()
                }
                Spacer()
            }
            .padding(12)
        }
        // Sets the reusable header height.
        .frame(height: 190)
        // Keeps all header content inside the header.
        .clipped()
    }
}

// Displays a preview of the reusable page header.
#Preview {
    // Creates one example ForgeFlow page header.
    SectionHeaderView(
        imageName: "ForgeFlow-splashscreen-V13",
        title: "ForgeFlow Dashboard",
        subtitle: "Build • Create • Deploy"
    )
}
