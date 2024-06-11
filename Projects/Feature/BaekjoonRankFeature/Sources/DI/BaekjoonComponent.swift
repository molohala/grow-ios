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
import RankServiceInterface
import ProfileDetailFeatureInterface
import BaekjoonSettingFeatureInterface

public protocol BaekjoonRankDependency: Dependency {
    var rankDomainBuildable: any RankDomainBuildable { get }
    var profileDetailBuildable: any ProfileDetailBuildable { get }
    var baekjoonSettingBuildable: any BaekjoonSettingBuildable { get}
}

public final class BaekjoonRankComponent: Component<BaekjoonRankDependency>, BaekjoonRankBuildable {
    public func makeView() -> some View {
        BaekjoonRankCoordinator(
            profileDetailBuildable: dependency.profileDetailBuildable, baekjoonSettingBuildable: dependency.baekjoonSettingBuildable,
            viewModel: .init(
                getTotalSolvedacRankUseCase: dependency.rankDomainBuildable.getTotalSolvedacRankUseCase,
                getWeekSolvedacRankUseCase: dependency.rankDomainBuildable.getWeekSolvedacRankUseCase
            )
        )
    }
}
