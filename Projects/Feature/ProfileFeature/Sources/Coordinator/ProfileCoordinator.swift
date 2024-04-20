//
//  ProfileCoordinator.swift
//  ProfileFeature
//
//  Created by dgsw8th71 on 4/9/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import SettingFeatureInterface
import ProfileFeatureInterface

public struct ProfileCoordinator: View {
    
    private let settingBuildable: any SettingBuildable
    private let viewModel: ProfileViewModel
    
    public init(
        settingBuildable: any SettingBuildable,
        viewModel: ProfileViewModel
    ) {
        self.settingBuildable = settingBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ProfileView(
            viewModel: viewModel
        )
        .navigationDestination(for: ProfileDestination.self) {
            switch $0 {
            case .setting: settingBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
