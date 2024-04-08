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

public protocol CommunityDependency: Dependency {
    var communityCreateBuildable: any CommunityCreateBuildable { get }
    var communityDetailBuildable: any CommunityDetailBuildable { get }
}

public final class CommunityComponent: Component<CommunityDependency>, CommunityBuildable {
    public func makeView() -> some View {
        CommunityView(communityCreateBuildable: dependency.communityCreateBuildable,
                      communityDetailBuildable: dependency.communityDetailBuildable)
    }
}
