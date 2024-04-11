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
                InfinityCommunityCell {}
                InfinityCommunityCell {}
                InfinityGithubRankCell(rank: 1, isMe: false) {
                    //
                }
                InfinityGithubRankCell(rank: 2, isMe: true) {
                    //
                }
            }
            //            }
            .infinityTopBar("디자인 시스템")
        }
    }
}
