//
//  MainViewType.swift
//  MainFeature
//
//  Created by dgsw8th71 on 4/2/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

import HomeFeature
import CommunityFeature
import GithubRankFeature
import BaekjoonRankFeature
import ProfileFeature

import DesignSystem

public enum MainViewType: CaseIterable {
    case Home
    case Community
    case GithubRank
    case BaekjoonRank
    case Profile
    
    var view: some View {
        Group {
            switch self {
            case .Home: HomeView()
            case .Community: CommunityView()
            case .GithubRank: GithubRankView()
            case .BaekjoonRank: BaekjoonRankView()
            case .Profile: ProfileView()
            }
        }
    }
    
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
        case .Community: "커뮤니티"
        case .GithubRank: "Github"
        case .BaekjoonRank: "백준"
        case .Profile: "프로필"
        }
    }
    
    var title: String {
        switch self {
        case .Home: "홈"
        case .Community: "커뮤니티"
        case .GithubRank: "Github 랭킹"
        case .BaekjoonRank: "백준 랭킹"
        case .Profile: "프로필"
        }
    }
}
