//
//  BaekjoonComponent.swift
//  BaekjoonSettingFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import BaekjoonSettingFeatureInterface

public protocol BaekjoonSettingDependency: Dependency {
    
}

public final class BaekjoonSettingComponent: Component<BaekjoonSettingDependency>, BaekjoonSettingBuildable {
    public func makeView() -> some View {
        BaekjoonSettingView()
    }
}
