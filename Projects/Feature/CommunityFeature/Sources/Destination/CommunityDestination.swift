//
//  CommunityDestination.swift
//  CommunityFeatureInterface
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import CommunityServiceInterface

public enum CommunityDestination: Hashable {
    case communityDetail(id: Int)
    case communityCreate
    case communityEdit(forumId: Int)
}
