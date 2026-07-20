//
//  AppTheme.swift
//  Matt-Comer-iOSApp4
//
//  Created by Matthew Comer on 2026-07-08.
//

import SwiftUI

// Stores the shared ForgeFlow colours used throughout the app.
struct AppTheme {
// Displays the main matte black background colour.
    static let background=Color.black
// Displays the main card background colour.
    static let panel=Color(red:0.055,green:0.025,blue:0.075)
// Displays the lighter card background colour.
    static let panelLight=Color(red:0.10,green:0.045,blue:0.13)
// Displays the primary ForgeFlow accent colour.
    static let primary=Color(red:0.86,green:0.14,blue:0.98)
// Displays the secondary accent colour.
    static let cyan=Color(red:0.05,green:0.80,blue:0.98)
// Displays the metallic gold accent colour.
    static let gold=Color(red:1.00,green:0.78,blue:0.02)
// Displays the danger colour.
    static let danger=Color(red:1.00,green:0.18,blue:0.38)
// Displays the primary text colour.
    static let textPrimary=Color.white
// Displays the secondary text colour.
    static let textSecondary=Color.white.opacity(0.72)
}
