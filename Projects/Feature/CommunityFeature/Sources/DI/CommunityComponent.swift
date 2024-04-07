//
//  CommunityComponent.swift
//  CommunityFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import CommunityFeatureInterface

public protocol CommunityDependency: Dependency {
    
}

public final class CommunityComponent: Component<CommunityDependency>, CommunityBuildable {
    public func makeView() -> some View {
        CommunityView()
    }
}
