import SwiftUI
import DesignSystem
import BaseFeature

public struct BaekjoonSettingView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @StateObject private var viewModel: BaekjoonSettingViewModel
    
    public init(
        viewModel: BaekjoonSettingViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack {
            GrowTextField("백준 ID", text: $viewModel.baekjoonId, isEnabled: !viewModel.baekjoonId.isEmpty)
                .padding(.bottom, 20)
            Spacer()
            GrowButton("완료하기", type: .CTA, isEnabled: !viewModel.baekjoonId.isEmpty) {
                await viewModel.completeSetting()
            }
            .padding(.horizontal, 12)
        }
        .growTopBar("백준 설정", background: .backgroundAlt) {
            router.popToStack()
        }
        .onChange(of: viewModel.completeFlow) {
            if case .success = $0 {
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
        .alert("백준 정보 수정 완료", isPresented: .init(
            get: { viewModel.completeFlow == .success(true) },
            set: { _ in })
        ) {
            Button("닫기") {
                viewModel.completeFlow = .fetching
            }
        }
    }
}
