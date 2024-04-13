//
//  Color+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public extension Color {
    
    static let baekjoon = Color(0x0076C0)
    static let github = Color(0x24292e)
    
    static let backgroundColor = Color(0xFFF7FAFF)
    
    static let gray500 = Color(0xAAAAAA)
    static let gray400 = Color(0xD1D1D1)
    static let gray300 = Color(0xE6E6E6)
    
    static let red400 = Color(0xFF2B2B)
    
    static let blue500 = Color(0x2597FF)
    static let orange500 = Color(0xFF8125)
    
    // hex to color
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
