//
//  MainComponent.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import MainFeatureInterface
import HomeFeatureInterface
import GithubRankFeatureInterface
import BaekjoonRankFeatureInterface
import ProfileFeatureInterface
import SettingFeatureInterface
import CommunityFeatureInterface
import ProfileDetailFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface
import ProfileEditFeatureInterface
import CommunityCreateFeatureInterface
import CommunityDetailFeatureInterface

public protocol MainDependency: Dependency {
    var settingBuildable: any SettingBuildable { get }
    var profileEditBuildable: any ProfileEditBuildable { get }
    var profileDetailBuildable: any ProfileDetailBuildable { get }
    var githubSettingBuildable: any GithubSettingBuildable { get }
    var baekjoonSettingBuildable: any BaekjoonSettingBuildable { get }
    var communityCreateBuildable: any CommunityCreateBuildable { get }
    var communityDetailBuildable: any CommunityDetailBuildable { get }
    var homeBuildable: any HomeBuildable { get }
    var communityBuildable: any CommunityBuildable { get }
    var githubRankBuildable: any GithubRankBuildable { get }
    var baekjoonRankBuildable: any BaekjoonRankBuildable { get }
    var profileBuildable: any ProfileBuildable { get }
}

public final class MainComponent: Component<MainDependency>, MainBuildable {
    public func makeView() -> some View {
        MainView(settingBuildable: dependency.settingBuildable,
                 profileEditBuilable: dependency.profileEditBuildable,
                 profileDetailBuildable: dependency.profileDetailBuildable,
                 githubSettingBuildable: dependency.githubSettingBuildable,
                 baekjoonSettingBuildable: dependency.baekjoonSettingBuildable,
                 communityCreateBuildable: dependency.communityCreateBuildable,
                 communityDetailBuildable: dependency.communityDetailBuildable,
                 homeBuildable: dependency.homeBuildable,
                 communityBuildable: dependency.communityBuildable, 
                 githubRankBuildable: dependency.githubRankBuildable,
                 baekjoonRankBuildable: dependency.baekjoonRankBuildable,
                 profileBuildable: dependency.profileBuildable)
    }
}
