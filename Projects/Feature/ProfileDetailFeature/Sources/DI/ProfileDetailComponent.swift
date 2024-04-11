//
//  ProfileDetailComponent.swift
//  ProfileDetailFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import ProfileDetailFeatureInterface

public protocol ProfileDetailDependency: Dependency {
    //
}

public final class ProfileDetailComponent: Component<ProfileDetailDependency>, ProfileDetailBuildable {
    public func makeView() -> some View {
        ProfileDetailView()
    }
}
