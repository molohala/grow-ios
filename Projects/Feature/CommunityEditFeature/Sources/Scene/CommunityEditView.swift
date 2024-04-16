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
            LazyVStack {
                InfinityTextEditor("내용을 적어주세요", text: $viewModel.content)
                    .frame(minHeight: 300)
            }
            .padding(.horizontal, 16)
        }
        .hideKeyboardWhenTap()
        .infinityTopBar("글 수정") {
            if viewModel.flow == .fetching {
                ProgressView()
            } else {
                Button("완료") {
                    Task {
                        await viewModel.createCommunity()
                    }
                }
            }
        }
        .onChange(of: viewModel.flow) {
            if $0 == .success {
                dismiss()
            }
        }
        .alert(
            viewModel.flow.rawValue,
            isPresented: .init(
                get: { viewModel.flow == .failure || viewModel.flow == .empty },
                set: { _ in viewModel.flow = .idle })
        ) {
            Button("확인", role: .cancel) {}
        }
    }
}
