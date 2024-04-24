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
                    get: { viewModel.flow == .success },
                    set: { _ in viewModel.flow = .idle })) {
                        Button("닫기") { viewModel.flow = .idle }
                    }
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .infinityTopBar("Github 설정")
        .alert("수정에 실패했습니다", isPresented: .init(
            get: { viewModel.flow == .failure },
            set: { _ in viewModel.flow = .idle }
        )) {
            Button("확인") {
                viewModel.flow = .idle
            }
        }
        .onChange(of: viewModel.flow) {
            if $0 == .success {
                appState.fetchProfile()
            }
        }
    }
}
