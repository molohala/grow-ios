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
import MainFeatureInterface
import SignInFeatureInterface
import AuthServiceInterface

public protocol RootDependency: Dependency {
    var mainBuildable: any MainBuildable { get }
    var signInBuildable: any SignInBuildable { get }
    var authDomainBuildable: any AuthDomainBuildable { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            mainBuildable: dependency.mainBuildable,
            signInBuildable: dependency.signInBuildable,
            setTokenUseCase: dependency.authDomainBuildable.setTokenUseCase,
            getTokenUseCase: dependency.authDomainBuildable.getTokenUseCase
        )
    }
}
