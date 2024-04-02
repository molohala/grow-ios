import SwiftUI

import BaseFeature

import DesignSystem

public struct ProfileEditView: View {
    
    @ObservedObject private var viewModel = ProfileEditViewModel()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            VStack {
                InfinityTextField("깃허브 아이디를 입력해 주세요", text: $viewModel.githubId)
                InfinityTextField("백준 아이디를 입력해 주세요", text: $viewModel.baekjoonId)
                
                Spacer()
                
                InfinityButton("완료하기") {
                }
                .disabled(viewModel.githubId.isEmpty || viewModel.baekjoonId.isEmpty)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .navigationTitle("프로필 수정")
    }
}
