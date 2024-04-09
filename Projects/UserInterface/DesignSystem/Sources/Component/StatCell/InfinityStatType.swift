//
//  InfinityStatType.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public enum InfinityStatType {
    case github(Int)
    case baekjoon(Int)
    
    var icon: Image {
        switch self {
        case .github:
            DesignSystemAsset.github.swiftUIImage
        case .baekjoon:
            DesignSystemAsset.baekjoon.swiftUIImage
        }
    }
    
    var title: String {
        switch self {
        case .github:
            "오늘 한 커밋 수"
        case .baekjoon:
            "오늘 푼 문제 수"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .github(let int):
                .github
        case .baekjoon(let int):
                .baekjoon
        }
    }
}
