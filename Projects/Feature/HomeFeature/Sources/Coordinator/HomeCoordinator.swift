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

public struct HomeCoordinator: View {
    
    private let communityDetailBuildable: any CommunityDetailBuildable
    private let profileDetailBuildable: any ProfileDetailBuildable
    
    public init(communityDetailBuildable: any CommunityDetailBuildable,
                profileDetailBuildable: any ProfileDetailBuildable
    ) {
        self.communityDetailBuildable = communityDetailBuildable
        self.profileDetailBuildable = profileDetailBuildable
    }
    
    public var body: some View {
        HomeView()
            .navigationDestination(for: HomeDestination.self) {
                switch $0 {
                case .communityDetail: communityDetailBuildable.makeView().eraseToAnyView()
                case .profileDetail: profileDetailBuildable.makeView().eraseToAnyView()
                }
            }
    }
}
