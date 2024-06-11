import BaseFeature
import SwiftUI
import DesignSystem

public struct CommunityEditView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CommunityEditViewModel
    
    public init(
        viewModel: CommunityEditViewModel
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
        .growTopBar("글 수정", trailingContent: {
            GrowTextButton("수정", type: .Small) {
                await viewModel.patchCommunity()
            }
            .padding(.horizontal, 4)
        }) {
            dismiss()
        }
        .onChange(of: viewModel.patchForumFlow) {
            if $0 == .success(true) {
                dismiss()
            }
        }
        .alert("내용을 입력해 주세요", isPresented: $viewModel.showNoContentDialog) {
            Button("확인", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("업로드를 실패했습니다", isPresented: .init(get: {
            viewModel.patchForumFlow == .failure
        }, set: { _ in
            viewModel.patchForumFlow = .fetching
        })) {
            Button("확인", role: .cancel) {}
        }
        .task {
            await viewModel.fetchForum()
        }
    }
}
