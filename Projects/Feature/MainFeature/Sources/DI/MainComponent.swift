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

public protocol MainDependency: Dependency {
    
}

public final class MainComponent: Component<MainDependency>, MainBuildable {
    public func makeView() -> some View {
        MainView()
    }
}
