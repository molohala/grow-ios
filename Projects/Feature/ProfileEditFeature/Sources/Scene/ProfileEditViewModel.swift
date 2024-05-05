//
//  ProfileEditViewModel.swift
//  ProfileEditFeature
//
//  Created by dgsw8th71 on 4/5/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import DesignSystem

final class ProfileEditViewModel: ObservableObject {
    @Published var jobs: [GrowJobType] = [.Android, .Designer]
}
