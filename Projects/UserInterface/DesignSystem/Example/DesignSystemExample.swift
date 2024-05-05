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
                GrowGithubRankCell(rank: 1, isMe: false) {
                    //
                }
                GrowGithubRankCell(rank: 2, isMe: true) {
                    //
                }
            }
            //            }
            .growTopBar("디자인 시스템")
        }
    }
}
