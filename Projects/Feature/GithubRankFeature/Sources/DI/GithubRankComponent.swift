//
//  GithubRankComponent.swift
//  GithubRankFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import NeedleFoundation
import SwiftUI
import GithubRankFeatureInterface

public protocol GithubRankDependency: Dependency {
    
}

public final class GithubRankComponent: Component<GithubRankDependency>, GithubRankBuildable {
    public func makeView() -> some View {
        GithubRankView()
    }
}
