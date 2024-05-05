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
import CommunityEditFeatureInterface
import CommunityServiceInterface

public protocol CommunityEditDependency: Dependency {
    var communityDomainBuildable: any CommunityDomainBuildable { get }
}

public final class CommunityEditComponent: Component<CommunityEditDependency>, CommunityEditBuildable {
    public func makeView(forumId: Int) -> some View {
        CommunityEditView(
            viewModel: CommunityEditViewModel(
                patchCommunityUseCase: dependency.communityDomainBuildable.patchCommunityUseCase,
                forumId: forumId
            )
        )
    }
}
