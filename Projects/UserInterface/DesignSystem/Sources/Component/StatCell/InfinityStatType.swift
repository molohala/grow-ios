//
//  InfinityStatType.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public enum InfinityStatType {
    case github(Int?=nil)
    case baekjoon(Int?=nil)
    
    var icon: Image {
        switch self {
        case .github:
            DesignSystemAsset.github.swiftUIImage
        case .baekjoon:
            DesignSystemAsset.baekjoon.swiftUIImage
        }
    }
    
    var iconColor: Color {
        switch self {
        case .github:
                .github
        case .baekjoon:
                .baekjoon
        }
    }
}
