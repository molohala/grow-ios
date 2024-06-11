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
import InfoServiceInterface
import LanguageServiceInterface

public protocol ProfileEditDependency: Dependency {
    var languageDomainBuildable: any LanguageDomainBuildable { get }
    var infoDomainBuildable: any InfoDomainBuildable { get }
}

public final class ProfileEditComponent: Component<ProfileEditDependency>, ProfileEditBuildable {
    public func makeView() -> some View {
        ProfileEditView(
            viewModel: .init(
                getMyLanguagesUseCase: dependency.languageDomainBuildable.getMyLanguagesUseCase,
                getLanguagesUseCase: dependency.languageDomainBuildable.getLanguagesUseCase,
                patchMyLanguagesUseCase: dependency.languageDomainBuildable.patchMyLanguagesUseCase,
                getJobsUseCase: dependency.infoDomainBuildable.getJobsUseCase,
                patchMyProfileUseCase: dependency.infoDomainBuildable.patchMyProfileUseCase
            )
        )
    }
}
