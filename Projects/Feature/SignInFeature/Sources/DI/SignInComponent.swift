//
//  SignInComponent.swift
//  SignInFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import NeedleFoundation
import SignInFeatureInterface
import AuthServiceInterface
import SwiftUI

public protocol SignInDependency: Dependency {
    var authDomainBuildable: any AuthDomainBuildable { get }
}

public final class SignInComponent: Component<SignInDependency>, SignInBuildable {
    public func makeView() -> some View {
        SignInView(
            viewModel: .init(
                signInUseCase: dependency.authDomainBuildable.signInUseCase,
                dAuthSignInUseCase: dependency.authDomainBuildable.dAuthSignInUseCase
            )
        )
    }
}
