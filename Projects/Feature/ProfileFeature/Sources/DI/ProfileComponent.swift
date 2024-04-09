//
//  ProfileComponent.swift
//  ProfileFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import ProfileFeatureInterface
import SettingFeatureInterface

public protocol ProfileDependency: Dependency {
    var settingBuildable: any SettingBuildable { get }
}

public final class ProfileComponent: Component<ProfileDependency>, ProfileBuildable {
    public func makeView() -> some View {
        ProfileCoordinator(
            settingBuildable: dependency.settingBuildable
        )
    }
}
