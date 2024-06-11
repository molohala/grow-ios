import BaseFeature
import SwiftUI
import DesignSystem

public struct CommunityCreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CommunityCreateViewModel
    
    public init(
        viewModel: CommunityCreateViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            GrowTextEditor(text: $viewModel.content)
                .frame(minHeight: 300)
                .padding(12)
        }
        .hideKeyboardWhenTap()
        .growTopBar("글쓰기", trailingContent: {
            GrowTextButton("완료", type: .Small) {
                await viewModel.createCommunity()
            }
            .padding(.horizontal, 4)
        }) {
            dismiss()
        }
        .onChange(of: viewModel.createForumFlow) {
            if $0 == .success(true) {
                dismiss()
            }
        }
        .alert("내용을 입력해 주세요", isPresented: $viewModel.showNoContentDialog) {
            Button("확인", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("업로드를 실패했습니다", isPresented: .init(get: {
            viewModel.createForumFlow == .failure
        }, set: { _ in
            viewModel.createForumFlow = .fetching
        })) {
            Button("확인", role: .cancel) {}
        }
    }
}
