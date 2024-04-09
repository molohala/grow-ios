//
//  SettingCoordinator.swift
//  SettingFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import ProfileEditFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface
import SettingFeatureInterface

public struct SettingCoordinator: View {
    
    private let profileEditBuildable: any ProfileEditBuildable
    private let githubSettingBuildable: any GithubSettingBuildable
    private let baekjoonSettingBuildable: any BaekjoonSettingBuildable
    private let viewModel: SettingViewModel
    
    public init(
        profileEditBuildable: any ProfileEditBuildable,
        githubSettingBuildable: any GithubSettingBuildable,
        baekjoonSettingBuildable: any BaekjoonSettingBuildable,
        viewModel: SettingViewModel
    ) {
        self.profileEditBuildable = profileEditBuildable
        self.githubSettingBuildable = githubSettingBuildable
        self.baekjoonSettingBuildable = baekjoonSettingBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        SettingView(
            viewModel: viewModel
        )
        .navigationDestination(for: SettingDestination.self) {
            switch $0 {
            case .baekjoonSetting: baekjoonSettingBuildable.makeView().eraseToAnyView()
            case .githubSetting: githubSettingBuildable.makeView().eraseToAnyView()
            case .profileEdit: profileEditBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
