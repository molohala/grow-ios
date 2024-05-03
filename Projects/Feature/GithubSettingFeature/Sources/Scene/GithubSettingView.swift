import SwiftUI
import DesignSystem
import BaseFeature

public struct GithubSettingView: View {
    
    @EnvironmentObject private var appState: AppState
    @ObservedObject private var viewModel: GithubSettingViewModel
    
    public init(
        viewModel: GithubSettingViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            VStack {
                InfinityTextField("Github Id를 입력해 주세요", text: $viewModel.githubId)
                
                Spacer()
                
                InfinityButton("완료하기") {
                    await viewModel.completeSetting()
                }
                .disabled(viewModel.githubId.isEmpty)
                .alert("Github 정보 수정 완료", isPresented: .init(
                    get: { viewModel.completeFlow == .success(true) },
                    set: { _ in })
                ) {
                    Button("닫기") { viewModel.completeFlow = .fetching }
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .infinityTopBar("Github 설정")
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
        .onChange(of: viewModel.completeFlow) {
            if $0 == .success(true) {
                appState.fetchProfile()
            }
        }
        .hideKeyboardWhenTap()
    }
}
