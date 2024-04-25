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
import RankServiceInterface

public protocol GithubRankDependency: Dependency {
    var profileDetailBuildable: any ProfileDetailBuildable { get }
    var githubSettingBuildable: any GithubSettingBuildable { get }
    var rankDomainBuildable: any RankDomainBuildable { get }
}

public final class GithubRankComponent: Component<GithubRankDependency>, GithubRankBuildable {
    public func makeView() -> some View {
        GithubRankCoordinator(
            profileDetailBuildable: dependency.profileDetailBuildable,
            githubSettingBuildable: dependency.githubSettingBuildable,
            viewModel: .init(
                getTotalGithubRankUseCase: dependency.rankDomainBuildable.getTotalGithubRankUseCase,
                getWeekGithubRankUseCase: dependency.rankDomainBuildable.getWeekGithubRankUseCase
            )
        )
    }
}
