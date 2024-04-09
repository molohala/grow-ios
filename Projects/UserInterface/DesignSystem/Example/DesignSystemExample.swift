//
//  BadgePreview.swift
//  Seugi
//
//  Created by dgsw8th71 on 3/23/24.
//  Copyright © 2024 seugi. All rights reserved.
//
import SwiftUI
import DesignSystem

@main
struct DesignSystemExample: App {
    
    @State private var t = ""
    
    var body: some Scene {
        WindowGroup {
            //            ScrollView {
            VStack {
                InfinitySelector(text: "전체", isSelected: true) {}
                InfinitySelector(text: "이번주", isSelected: false) {}
                InfinityTextField("id", text: $t)
                ForEach(InfinityJobType.allCases, id: \.self) {
                    InfinityJob($0)
                }
            }
            //            }
            .infinityTopBar("디자인 시스템")
        }
    }
}
