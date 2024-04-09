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
    
    public init(settingBuildable: any SettingBuildable) {
        self.settingBuildable = settingBuildable
    }
    
    public var body: some View {
        ProfileView()
            .navigationDestination(for: ProfileDestination.self) {
                switch $0 {
                case .setting: settingBuildable.makeView().eraseToAnyView()
                }
            }
    }
}
