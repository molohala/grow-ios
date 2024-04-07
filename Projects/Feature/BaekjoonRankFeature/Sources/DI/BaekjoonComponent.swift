//
//  BaekjoonComponent.swift
//  BaekjoonRankFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import BaekjoonRankFeatureInterface

public protocol BaekjoonRankDependency: Dependency {
    
}

public final class BaekjoonRankComponent: Component<BaekjoonRankDependency>, BaekjoonRankBuildable {
    public func makeView() -> some View {
        BaekjoonRankView()
    }
}
