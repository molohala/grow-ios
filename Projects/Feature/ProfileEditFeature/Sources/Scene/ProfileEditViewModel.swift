//
//  ProfileEditViewModel.swift
//  ProfileEditFeature
//
//  Created by dgsw8th71 on 4/5/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import Foundation
import DesignSystem

public final class ProfileEditViewModel: ObservableObject {
    
    @Published var bio = ""
    @Published var jobs = ["Server", "Web", "Android", "iOS", "Game", "Designer", "Developer"]
    @Published var languages = ["Python", "HTML", "CSS", "JavaScript", "TypeScript", "Swift", "Java", "Kotlin"]
    
    @MainActor
    func completeSetting() async {
        //
    }
}
