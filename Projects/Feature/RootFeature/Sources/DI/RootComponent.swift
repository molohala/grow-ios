//
//  RootComponent.swift
//  RootFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import RootFeatureInterface

public protocol RootDependency: Dependency {
    
}

public final class RootComponent: Component<RootDependency>, RootBuildable {
    public func makeView() -> some View {
        RootView()
    }
}
