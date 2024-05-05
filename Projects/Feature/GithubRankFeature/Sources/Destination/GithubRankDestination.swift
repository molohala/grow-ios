//
//  GithubDestination.swift
//  GithubRankFeatureInterface
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public enum GithubRankDestination: Hashable {
    case profileDetail(memberId: Int)
    case githubSetting
}
