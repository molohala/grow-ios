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
