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

public struct CommunityCoordinator: View {
    
    private let communityCreateBuildable: any CommunityCreateBuildable
    private let communityDetailBuildable: any CommunityDetailBuildable
    
    public init(communityCreateBuildable: any CommunityCreateBuildable,
                communityDetailBuildable: any CommunityDetailBuildable) {
        self.communityCreateBuildable = communityCreateBuildable
        self.communityDetailBuildable = communityDetailBuildable
    }
    
    public var body: some View {
        CommunityView()
            .navigationDestination(for: CommunityDestination.self) {
                switch $0 {
                case .communityCreate: communityCreateBuildable.makeView().eraseToAnyView()
                case .communityDetail: communityDetailBuildable.makeView().eraseToAnyView()
                }
            }
    }
}
