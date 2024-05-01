//
//  HomeNavigation.swift
//  HomeFeatureInterface
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation

public enum HomeDestination: Hashable {
    case profileDetail(memberId: Int)
    case communityDetail
}
