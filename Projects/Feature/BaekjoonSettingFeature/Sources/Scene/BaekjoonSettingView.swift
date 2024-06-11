import SwiftUI
import DesignSystem
import BaseFeature

public struct BaekjoonSettingView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: BaekjoonSettingViewModel
    
    public init(
        viewModel: BaekjoonSettingViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                GrowHeadline("백준 ID")
                    .toLeading()
                    .padding(.horizontal, 4)
                GrowTextField("", text: $viewModel.baekjoonId)
            }
            .padding(.top, 20)
            Spacer()
            GrowButton("완료", type: .CTA, leadingIcon: .check, isEnabled: !viewModel.baekjoonId.isEmpty) {
                await viewModel.completeSetting()
            }
            .padding(.horizontal, 4)
        }
        .padding(.horizontal, 16)
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
            Button("확인") {
                viewModel.completeFlow = .fetching
                dismiss()
            }
        }
        .onAppear {
            if case .success(let profile) = appState.profile,
                let baekjoonId = profile.baekjoonId {
                viewModel.baekjoonId = baekjoonId
            }
        }
    }
}
