//
//  BadgePreview.swift
//  Seugi
//
//  Created by dgsw8th71 on 3/23/24.
//  Copyright © 2024 seugi. All rights reserved.
//
import SwiftUI
import DesignSystem
import MyDesignSystem

@main
struct DesignSystemExample: App {
    
    @State var s = false
    
    var body: some Scene {
        WindowGroup {
            GrowPreview.preview
                .environmentObject(ColorProvider(isDarkTheme: s))
                .onTapGesture(count: 2) {
                    s.toggle()
                }
        }
    }
}

import UIKit

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
