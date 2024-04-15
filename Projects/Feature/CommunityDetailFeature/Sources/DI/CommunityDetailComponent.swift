//
//  CommunityDetailCompontny.swift
//  CommunityDetailFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import CommunityDetailFeatureInterface
import CommunityServiceInterface

public protocol CommunityDetailDependency: Dependency {
    var communityDomainBuildable: any CommunityDomainBuildable { get }
}

public final class CommunityDetailComponent: Component<CommunityDetailDependency>, CommunityDetailBuildable {
    public func makeView(id: Int) -> some View {
        CommunityDetailView(
            viewModel: .init(
                getCommunityUseCase: dependency.communityDomainBuildable.getCommunityUseCase
            ),
            id: id
        )
    }
}
