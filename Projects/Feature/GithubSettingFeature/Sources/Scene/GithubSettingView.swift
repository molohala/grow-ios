//
//  GithubEditView.swift
//  ProfileEditFeature
//
//  Created by dgsw8th71 on 4/5/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct GithubSettingView: View {
    
    @ObservedObject private var viewModel = GithubSettingViewModel()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            VStack {
                InfinityTextField("Github Id를 입력해 주세요", text: $viewModel.githubId)
                
                Spacer()
                
                InfinityButton("완료하기") {
                }
                .disabled(viewModel.githubId.isEmpty)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .infinityTopBar("Github 설정")
    }
}
