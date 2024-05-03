//
//  GithubRankCoordinator.swift
//  GithubRankFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import ProfileDetailFeatureInterface
import BaekjoonSettingFeatureInterface
import BaekjoonRankFeatureInterface

public struct BaekjoonRankCoordinator: View {
    
    private let profileDetailBuildable: any ProfileDetailBuildable
    private let baekjoonSettingBuildable: any BaekjoonSettingBuildable
    private let viewModel: BaekjoonRankViewModel
    
    public init(
        profileDetailBuildable: any ProfileDetailBuildable,
        baekjoonSettingBuildable: any BaekjoonSettingBuildable,
        viewModel: BaekjoonRankViewModel
    ) {
        self.profileDetailBuildable = profileDetailBuildable
        self.baekjoonSettingBuildable = baekjoonSettingBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        BaekjoonRankView(
            viewModel: viewModel
        )
        .navigationDestination(for: BaekjoonDestination.self) {
            switch $0 {
            case .profileDetail(let memberId): profileDetailBuildable.makeView(memberId: memberId).eraseToAnyView()
            case .baekjoonSetting: baekjoonSettingBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
