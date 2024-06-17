import BaseFeature
import SwiftUI
import DesignSystem
import MyDesignSystem

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
            VStack(alignment: .leading, spacing: 4) {
                MyTextEditor(text: $viewModel.content)
                    .frame(minHeight: 300)
                Text("* 부적절하거나 불쾌감을 줄 수 있는 컨텐츠는 글 작성 불가, 계정 정지 등의 제재를 받을 수 있습니다")
                    .myColor(.textWarning)
                    .myFont(.labelR)
                    .multilineTextAlignment(.leading)
            }
            .padding(12)
        }
        .hideKeyboardWhenTap()
        .myTopBar("글쓰기", trailingContent: {
            MyTextButton("완료", type: .Small) {
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
