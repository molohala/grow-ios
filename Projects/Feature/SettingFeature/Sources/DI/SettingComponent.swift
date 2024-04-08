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
import ProfileEditFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface

public protocol SettingDependency: Dependency {
    var profileEditBuildable: any ProfileEditBuildable { get }
    var githubSettingBuildable: any GithubSettingBuildable { get }
    var baekjoonSettingBuildable: any BaekjoonSettingBuildable { get }
}

public final class SettingComponent: Component<SettingDependency>, SettingBuildable {
    public func makeView() -> some View {
        SettingView(profileEditBuildable: dependency.profileEditBuildable,
                    githubSettingBuildable: dependency.githubSettingBuildable,
                    baekjoonSettingBuildable: dependency.baekjoonSettingBuildable)
    }
}
