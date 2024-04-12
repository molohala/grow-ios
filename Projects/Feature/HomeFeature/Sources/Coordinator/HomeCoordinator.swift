//
//  HomeCoordinator.swift
//  HomeFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import ProfileDetailFeatureInterface
import CommunityDetailFeatureInterface
import HomeFeatureInterface
import CommunityFeatureInterface

public struct HomeCoordinator: View {
    
    private let communityDetailBuildable: any CommunityDetailBuildable
    private let profileDetailBuildable: any ProfileDetailBuildable
    private let viewModel: HomeViewModel
    
    public init(
        communityDetailBuildable: any CommunityDetailBuildable,
        profileDetailBuildable: any ProfileDetailBuildable,
        viewModel: HomeViewModel
    ) {
        self.communityDetailBuildable = communityDetailBuildable
        self.profileDetailBuildable = profileDetailBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        HomeView(
            viewModel: viewModel
        )
        .navigationDestination(for: HomeDestination.self) {
            switch $0 {
            case .communityDetail: communityDetailBuildable.makeView().eraseToAnyView()
            case .profileDetail: profileDetailBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
