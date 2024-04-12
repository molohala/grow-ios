//
//  CommunityComponent.swift
//  CommunityFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import CommunityFeatureInterface
import CommunityCreateFeatureInterface
import CommunityDetailFeatureInterface
import CommunityServiceInterface
import LikeServiceInterface

public protocol CommunityDependency: Dependency {
    var communityCreateBuildable: any CommunityCreateBuildable { get }
    var communityDetailBuildable: any CommunityDetailBuildable { get }
    var communityDomainBuildable: any CommunityDomainBuildable { get }
    var likeDomainBuildable: any LikeDomainBuildable { get }
}

public final class CommunityComponent: Component<CommunityDependency>, CommunityBuildable {
    
    public func makeView() -> some View {
        CommunityCoordinator(
            communityCreateBuildable: dependency.communityCreateBuildable,
            communityDetailBuildable: dependency.communityDetailBuildable,
            viewModel: .init(
                getCommunitesUseCase: dependency.communityDomainBuildable.getCommunitiesUseCase,
                patchLikeUseCase: dependency.likeDomainBuildable.patchLikeUseCase
            )
        )
    }
    
    public func makeCommunityCell(community: Community, action: @escaping () -> Void) -> some View {
        CommunityCell(community: community, action: action)
    }
}
