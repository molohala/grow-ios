//
//  MainViewType.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

import HomeFeatureInterface
import CommunityFeatureInterface
import GithubRankFeatureInterface
import BaekjoonRankFeatureInterface
import ProfileFeatureInterface

import DesignSystem

public enum MainViewType: CaseIterable {
    case Home
    case Community
    case GithubRank
    case BaekjoonRank
    case Profile
    
    var image: Image {
        switch self {
        case .Home: DesignSystemAsset.home.swiftUIImage
        case .Community: DesignSystemAsset.community.swiftUIImage
        case .GithubRank: DesignSystemAsset.github.swiftUIImage
        case .BaekjoonRank: DesignSystemAsset.baekjoon.swiftUIImage
        case .Profile: DesignSystemAsset.profile.swiftUIImage
        }
    }
    
    var name: String {
        switch self {
        case .Home: "홈"
        case .Community: "포럼"
        case .GithubRank: "Github"
        case .BaekjoonRank: "백준"
        case .Profile: "프로필"
        }
    }
    
    var title: String {
        switch self {
        case .Home: "홈"
        case .Community: "포럼"
        case .GithubRank: "Github 랭킹"
        case .BaekjoonRank: "백준 랭킹"
        case .Profile: "프로필"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .Home: .backgroundColor
        case .Community: .backgroundColor
        case .GithubRank: .white
        case .BaekjoonRank: .white
        case .Profile: .backgroundColor
        }
    }
}
