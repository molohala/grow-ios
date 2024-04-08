//
//  GithubRankComponent.swift
//  GithubRankFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import NeedleFoundation
import SwiftUI
import GithubRankFeatureInterface
import ProfileDetailFeatureInterface
import GithubSettingFeatureInterface

public protocol GithubRankDependency: Dependency {
    var profileDetailBuildable: any ProfileDetailBuildable { get }
    var githubSettingBuildable: any GithubSettingBuildable { get }
}

public final class GithubRankComponent: Component<GithubRankDependency>, GithubRankBuildable {
    public func makeView() -> some View {
        GithubRankView(
            profileDetailBuildable: dependency.profileDetailBuildable,
            githubSettingBuildable: dependency.githubSettingBuildable
        )
    }
}
