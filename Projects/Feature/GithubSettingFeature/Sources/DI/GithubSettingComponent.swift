//
//  GithubSettingComponent.swift
//  GithubSettingFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import GithubSettingFeatureInterface

public protocol GithubSettingDependency: Dependency {
    
}

public final class GithubSettingComponent: Component<GithubSettingDependency>, GithubSettingBuildable {
    public func makeView() -> some View {
        GithubSettingView()
    }
}
