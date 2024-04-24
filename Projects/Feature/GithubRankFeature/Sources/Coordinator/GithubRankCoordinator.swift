//
//  GithubRankCoordinator.swift
//  GithubRankFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import ProfileDetailFeatureInterface
import GithubSettingFeatureInterface
import GithubRankFeatureInterface

public struct GithubRankCoordinator: View {
    
    private let profileDetailBuildable: any ProfileDetailBuildable
    private let githubSettingBuildable: any GithubSettingBuildable
    private let viewModel: GithubRankViewModel
    
    public init(
        profileDetailBuildable: any ProfileDetailBuildable,
        githubSettingBuildable: any GithubSettingBuildable,
        viewModel: GithubRankViewModel
    ) {
        self.profileDetailBuildable = profileDetailBuildable
        self.githubSettingBuildable = githubSettingBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        GithubRankView(
            viewModel: viewModel
        )
        .navigationDestination(for: GithubRankDestination.self) {
            switch $0 {
            case .profileDetail: profileDetailBuildable.makeView().eraseToAnyView()
            case .githubSetting: githubSettingBuildable.makeView("").eraseToAnyView()
            }
        }
    }
}
