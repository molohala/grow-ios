import BaseFeature
import SwiftUI
import CommunityDetailFeatureInterface
import DesignSystem
import CommunityServiceInterface
import CommentServiceInterface

public struct CommunityDetailView: View {
    
    @StateObject private var viewModel: CommunityDetailViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @State private var proxy: ScrollViewProxy?
    @State private var showRemovingCommunity = false
    
    public init(
        viewModel: CommunityDetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView {
                    Group {
                        switch viewModel.community {
                        case .fetching:
                            EmptyView() // todo
                        case .success(let data):
                            VStack(spacing: 8) {
                                makeForum(data)
                                GrowDivider()
                                comments
                                Spacer().frame(height: 64)
                            }
                        case .failure:
                            Text("불러오기 실패")
                        }
                    }
                    .onAppear {
                        self.proxy = proxy
                    }
                }
            }
        }
        .hideKeyboardWhenTap()
        .growTopBar("", background: .backgroundAlt, backButtonAction: {
            dismiss()
        })
        .task {
            async let fetchCommunity: () = viewModel.fetchCommunity()
            async let fetchComment: () = viewModel.fetchComments()
            _ = await (fetchCommunity, fetchComment)
        }
        .refreshable {
            Task {
                async let fetchCommunity: () = viewModel.fetchCommunity()
                async let fetchComments: () = viewModel.fetchComments()
                _ = await [fetchCommunity, fetchComments]
            }
        }
        .onChange(of: viewModel.removeCommunityFlow) {
            if case .success = $0 {
                dismiss()
            }
        }
        .alert(
            "게시글을 불러올 수 없습니다",
            isPresented: .init(
                get: { viewModel.comments == .failure || viewModel.comments == .failure },
                set: { _ in dismiss() }
            )
        ) {
            Button("확인", role: .cancel) {
                dismiss()
            }
        }
        .eraseToAnyView()
        .alert("댓글을 삭제하시겠습니까?",
               isPresented: .init(get: { viewModel.showRemovingComment },
                                  set: { _ in
            viewModel.showRemovingComment = false
        })) {
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeComment()
                }
            }
            Button("아니요", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("게시글을 삭제하시겠습니까?",
               isPresented: $showRemovingCommunity) {
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeCommuntiy()
                }
            }
            Button("아니요", role: .cancel) {}
        }
    }
    
    @ViewBuilder
    private func makeForum(_ forum: CommunityContent) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                GrowAvatar(type: .medium)
                VStack(alignment: .leading, spacing: 0) {
                    Text(forum.writerName)
                        .growFont(.bodyB)
                        .growColor(.textNormal)
                    Text(forum.createdAt.timeAgo)
                        .growFont(.labelM)
                        .growColor(.textAlt)
                }
                Spacer()
                Menu {
                    Button("수정하기", role: .cancel) {
                        // action
                    }
                    Button("삭제하기", role: .destructive) {
                        // action
                    }
                } label: {
                    Image(icon: .detailVertical)
                        .resizable()
                        .growIconColor(.textAlt)
                        .frame(size: 24)
                }
            }
            Text(forum.content)
                .growFont(.bodyR)
                .growColor(.textNormal)
            GrowLikeButton(
                like: forum.like,
                isLiked: forum.liked) {
                    // action
                }
        }
        .padding(12)
    }
    
    @ViewBuilder
    private var comments: some View {
        switch viewModel.comments {
        case .fetching:
            GrowCommentCellShimmer()
        case .success(let data):
            VStack(spacing: 4) {
                if case .success(let profile) = appState.profile {
                    ForEach(data, id: \.commentId) { comment in
                        GrowCommentCell(comment: comment, profileId: profile.id) {
                            // remove action
                        }
                    }
                }
            }
        case .failure:
            Text("불러오기 실패")
        }
    }
}
