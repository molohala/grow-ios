//
//  View+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

struct InfinityAnimationButton: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .addPressAnimation(configuration.isPressed)
    }
}

public extension View {
    
    func addPressAnimation(_ isPressed: Bool) -> some View {
        self
            .opacity(isPressed ? 0.64 : 1)
            .scaleEffect(isPressed ? 0.96 : 1)
            .animation(.easeOut, value: 1)
            .disabled(isPressed)
    }
    
    func applyAnimation() -> some View {
        self
            .buttonStyle(InfinityAnimationButton())
    }
}
