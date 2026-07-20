//
//  StatusBadgeView.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI


// Displays one compact mission information badge.
struct StatusBadgeView:View {
// Stores the text shown inside the badge.
    var title:String
// Stores the badge accent colour.
    var color:Color
    // Displays the mission badge interface.
    var body:some View {
    // Displays the badge title.
        Text(title.uppercased())
            .font(.caption2)
            .fontWeight(.bold)
            .foregroundStyle(color)
            .padding(.horizontal,10)
            .padding(.vertical,6)
            .background(Color.black.opacity(0.45))
            .clipShape(Capsule())
            .overlay(
                // Displays the badge border.
                Capsule()
                    .stroke(color,lineWidth:1)
            )
    }
}

// Displays a preview of the mission badge.
#Preview {
    // Displays one sample mission badge.
    StatusBadgeView(title:"Development",color:AppTheme.cyan)
        .padding()
        .background(Color.black)
}
