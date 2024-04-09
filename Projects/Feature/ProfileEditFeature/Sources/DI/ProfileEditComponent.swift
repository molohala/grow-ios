//
//  ProfileEditComponent.swift
//  ProfileEditFeature
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import SwiftUI
import NeedleFoundation
import ProfileEditFeatureInterface

public protocol ProfileEditDependency: Dependency {
    //
}

public final class ProfileEditComponent: Component<ProfileEditDependency>, ProfileEditBuildable {
    public func makeView() -> some View {
        ProfileEditView()
    }
}
