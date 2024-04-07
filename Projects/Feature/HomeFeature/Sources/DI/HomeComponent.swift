//
//  HomeComponent.swift
//  HomeFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import HomeFeatureInterface

public protocol HomeDependency: Dependency {
    
}

public final class HomeComponent: Component<HomeDependency>, HomeBuildable {
    public func makeView() -> some View {
        HomeView()
    }
}
