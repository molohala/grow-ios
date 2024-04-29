//
//  CommunityCoordinator.swift
//  CommunityFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import CommunityFeatureInterface
import CommunityCreateFeatureInterface
import CommunityDetailFeatureInterface
import CommunityEditFeatureInterface
import CommunityServiceInterface
import LikeServiceInterface

public struct CommunityCoordinator: View {
    
    private let communityCreateBuildable: any CommunityCreateBuildable
    private let communityDetailBuildable: any CommunityDetailBuildable
    private let communityEditBuildable: any CommunityEditBuildable
    private let viewModel: CommunityViewModel
    
    public init(
        communityCreateBuildable: any CommunityCreateBuildable,
        communityDetailBuildable: any CommunityDetailBuildable,
        communityEditBuildable: any CommunityEditBuildable,
        viewModel: CommunityViewModel
    ) {
        self.communityCreateBuildable = communityCreateBuildable
        self.communityDetailBuildable = communityDetailBuildable
        self.communityEditBuildable = communityEditBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        CommunityView(viewModel: viewModel)
            .navigationDestination(for: CommunityDestination.self) {
                switch $0 {
                case .communityCreate: communityCreateBuildable.makeView().eraseToAnyView()
                case .communityDetail(let id): communityDetailBuildable.makeView(id: id).eraseToAnyView()
                case .communityEdit(let communityContent): communityEditBuildable.makeView(communityContent: communityContent).eraseToAnyView()
                }
            }
    }
}
