import SwiftUI
import DesignSystem
import BaseFeature

public struct BaekjoonSettingView: View {
    
    @EnvironmentObject private var appState: AppState
    @ObservedObject private var viewModel: BaekjoonSettingViewModel
    
    public init(
        viewModel: BaekjoonSettingViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            VStack {
                InfinityTextField("백준 Id를 입력해 주세요", text: $viewModel.baekjoonId)
                
                Spacer()
                
                InfinityButton("완료하기", isLoading: viewModel.flow == .fetching) {
                    await viewModel.completeSetting()
                }
                .disabled(viewModel.baekjoonId.isEmpty)
                .alert("백준 정보 수정 완료", isPresented: .init(
                    get: { viewModel.flow == .success },
                    set: { _ in viewModel.flow = .idle })) {
                        Button("닫기") { viewModel.flow = .idle }
                    }
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .infinityTopBar("백준 설정")
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
        .hideKeyboardWhenTap()
    }
}
