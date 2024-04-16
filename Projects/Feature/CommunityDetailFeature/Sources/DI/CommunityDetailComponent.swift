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
import CommentServiceInterface

public protocol CommunityDetailDependency: Dependency {
    var communityDomainBuildable: any CommunityDomainBuildable { get }
    var commentDomainBuildable: any CommentDomainBuildable { get }
}

public final class CommunityDetailComponent: Component<CommunityDetailDependency>, CommunityDetailBuildable {
    public func makeView(id: Int) -> some View {
        CommunityDetailView(
            viewModel: .init(
                getCommunityUseCase: dependency.communityDomainBuildable.getCommunityUseCase,
                getCommentUseCase: dependency.commentDomainBuildable.getCommentsUseCase,
                createCommentUseCase: dependency.commentDomainBuildable.createCommentUseCase,
                communityId: id
            )
        )
    }
}
