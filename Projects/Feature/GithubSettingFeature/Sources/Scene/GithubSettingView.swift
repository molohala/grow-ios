import SwiftUI
import DesignSystem
import BaseFeature

public struct GithubSettingView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: GithubSettingViewModel
    
    public init(
        viewModel: GithubSettingViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                GrowHeadline("Github ID")
                    .toLeading()
                    .padding(.horizontal, 4)
                GrowTextField("", text: $viewModel.githubId, isEnabled: !viewModel.githubId.isEmpty)
            }
            .padding(.top, 20)
            Spacer()
            GrowButton("완료", type: .CTA, leadingIcon: .check, isEnabled: !viewModel.githubId.isEmpty) {
                await viewModel.completeSetting()
            }
            .padding(.horizontal, 4)
        }
        .padding(.horizontal, 16)
        .growTopBar("Github 설정", background: .backgroundAlt) {
            router.popToStack()
        }
        .onChange(of: viewModel.completeFlow) {
            if $0 == .success(true) {
                Task {
                    await appState.fetchProfile()
                }
            }
        }
        .hideKeyboardWhenTap()
        .alert("수정에 실패했습니다", isPresented: .init(
            get: { viewModel.completeFlow == .failure },
            set: { _ in }
        )) {
            Button("확인") {
                viewModel.completeFlow = .fetching
            }
        } message: {
            Text("아이디를 다시 확인해 주세요")
        }
        .eraseToAnyView()
        .alert("Github 정보 수정 완료", isPresented: .init(
            get: { viewModel.completeFlow == .success(true) },
            set: { _ in })
        ) {
            Button("닫기") { 
                viewModel.completeFlow = .fetching
                dismiss()
            }
        }
        .onAppear {
            if case .success(let profile) = appState.profile,
                let githubId = profile.githubId {
                viewModel.githubId = githubId
            }
        }
    }
}
