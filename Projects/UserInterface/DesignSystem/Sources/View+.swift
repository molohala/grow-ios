//
//  View+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import UIKit

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


public extension View {
    func hideKeyboardWhenTap() -> some View {
        onAppear(perform: UIApplication.shared.hideKeyboard)
    }
}

public extension UIApplication {
    func hideKeyboard() {
        guard let scene = connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return false
    }
}

public extension View {
    
    func applyCardView() -> some View {
        self
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color(0x000000, alpha: 0.04), radius: 8, y: 3)
     }
}
