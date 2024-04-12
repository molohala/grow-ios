//
//  HomeComponent.swift
//  HomeFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import HomeFeatureInterface
import ProfileDetailFeatureInterface
import CommunityDetailFeatureInterface
import ProfileFeatureInterface
import CommunityFeatureInterface

public protocol HomeDependency: Dependency {
    var profileDetailBuildable: any ProfileDetailBuildable { get }
    var communityDetailBuildable: any CommunityDetailBuildable { get }
    var profileBuildable: any ProfileBuildable { get }
    var communityBuildable: any CommunityBuildable { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeBuildable {
    public func makeView() -> some View {
        HomeCoordinator(
            communityDetailBuildable: dependency.communityDetailBuildable,
            profileDetailBuildable: dependency.profileDetailBuildable,
            viewModel: .init()
        )
    }
}
