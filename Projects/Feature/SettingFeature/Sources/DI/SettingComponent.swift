//
//  SettingComponent.swift
//  SettingFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import SettingFeatureInterface

public protocol SettingDependency: Dependency {
    
}

public final class SettingComponent: Component<SettingDependency>, SettingBuildable {
    public func makeView() -> some View {
        SettingView()
    }
}
