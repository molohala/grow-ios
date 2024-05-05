//
//  View+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import UIKit

struct GrowAnimationButton: ButtonStyle {
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
            .buttonStyle(GrowAnimationButton())
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
    func toLeading() -> some View {
        HStack {
            self
            Spacer()
        }
    }
    
    func toTrailing() -> some View {
        HStack {
            Spacer()
            self
        }
    }
    
    func toTop() -> some View {
        VStack {
            self
            Spacer()
        }
    }
    
    func toBottom() -> some View {
        VStack {
            Spacer()
            self
        }
    }
    
    func toCenter() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                self
                Spacer()
            }
            Spacer()
        }
    }
}

public extension View {
    func frame(size: CGFloat) -> some View {
        self
            .frame(width: size, height: size)
    }
}
