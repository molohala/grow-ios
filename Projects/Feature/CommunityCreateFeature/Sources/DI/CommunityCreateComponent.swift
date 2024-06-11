//
//  CommunityCreateComponent.swift
//  CommunityCreateFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import CommunityCreateFeatureInterface
import CommunityServiceInterface

public protocol CommunityCreateDependency: Dependency {
    var communityDomainBuildable: any CommunityDomainBuildable { get }
}

public final class CommunityCreateComponent: Component<CommunityCreateDependency>, CommunityCreateBuildable {
    public func makeView() -> some View {
        CommunityCreateView(
            viewModel: CommunityCreateViewModel(
                createCommunityUseCase: dependency.communityDomainBuildable.createCommunityUseCase
            )
        )
    }
}
