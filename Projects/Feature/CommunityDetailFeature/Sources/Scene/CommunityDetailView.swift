import BaseFeature
import SwiftUI
import CommunityDetailFeatureInterface
import DesignSystem
import CommunityServiceInterface
import CommentServiceInterface
import MyDesignSystem
import OpenGraph

public struct CommunityDetailView: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    @Environment(\.dismiss) private var dismiss
//    #if canImport(UIKit)
//    @Environment(\.safeAreaInsets) private var safeAreaInsets
//    #endif
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @State private var proxy: ScrollViewProxy?
    @StateObject private var viewModel: CommunityDetailViewModel
    @State private var showRemoveCommunityDialog = false
    @State private var showRemoveCommentDialog = false
    @State private var isCreateCommentFetch = false
    @State private var showReportCommunityDialog = false
    @State private var showReportCommentDialog = false
    
    public init(
        viewModel: CommunityDetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    private var links: [String] {
        if case .success(let data) = viewModel.community {
            data.content.links
        } else {
            []
        }
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
                                MyDivider()
                                comments
                                Spacer().frame(height: 64)
                            }
                        case .failure:
                            EmptyView()
                        }
                    }
                    .onAppear {
                        self.proxy = proxy
                    }
                }
            }
            .ignoresSafeArea(edges: .bottom)
            let isDisabled = viewModel.currentComment.isEmpty
            HStack(spacing: 8) {
                MyTextEditor(text: $viewModel.currentComment, isRounded: true)
                    .frame(height: 52)
                    .myBackground(.backgroundAlt)
                    .cornerRadius(26, corners: .allCorners)
                Button {
                    isCreateCommentFetch = true
                    Task {
                        await viewModel.createComment()
                        isCreateCommentFetch = false
                    }
                } label: {
                    Image(icon: .send)
                        .resizable()
                        .myIconColor(isDisabled ? .textFieldIconDisabled : .textFieldIcon)
                        .frame(size: 28)
                        .padding(4)
                        .opacity(isCreateCommentFetch ? 0 : 1)
                        .overlay {
                            if isCreateCommentFetch {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: colorProvider.color(.textFieldIcon)))
                            }
                        }
                }
                .disabled(isDisabled)
            }
            .padding(.horizontal, 12)
            .toBottom()
        }
        .hideKeyboardWhenTap()
        .myTopBar("", background: .backgroundAlt, backButtonAction: {
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
        .alert("게시글을 삭제하시겠습니까?", isPresented: $showRemoveCommunityDialog) {
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeCommuntiy()
                }
            }
            Button("아니요", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("게시글이 삭제되었습니다", isPresented: .init(get: {
            viewModel.removeCommunityFlow == .success(true)
        }, set: { _ in })) {
            Button("닫기", role: .cancel) {
                dismiss()
            }
        }
        .eraseToAnyView()
        .alert("댓글을 삭제하시겠습니까?", isPresented: $showRemoveCommentDialog) {
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeComment()
                }
            }
            Button("아니요", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("댓글이 삭제되었습니다", isPresented: .init(get: {
            viewModel.removeCommentFlow == .success(true)
        }, set: { _ in
            viewModel.removeCommentFlow = .fetching
        })) {
            Button("닫기", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("신고 내용을 작성해주세요", isPresented: $showReportCommentDialog) {
            TextField("", text: $viewModel.reportCommentReason)
            Button("취소", role: .cancel) {}
            Button("신고", role: .destructive) {
                Task {
                    await viewModel.reportComment()
                }
            }
        }
        .eraseToAnyView()
        .alert("신고 내용을 작성해주세요", isPresented: $showReportCommunityDialog) {
            TextField("", text: $viewModel.reportCommunityReason)
            Button("취소", role: .cancel) {}
            Button("신고", role: .destructive) {
                Task {
                    await viewModel.reportCommunity()
                }
            }
        } message: {
            Text("검토까지는 최대 24시간이 소요됩니다")
        }
    }
    
    @ViewBuilder
    private func makeForum(_ forum: CommunityContent) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                MyAvatar(type: .medium)
                VStack(alignment: .leading, spacing: 0) {
                    Text(forum.writerName)
                        .myFont(.bodyB)
                        .myColor(.textNormal)
                    Text(forum.createdAt.timeAgo)
                        .myFont(.labelM)
                        .myColor(.textAlt)
                }
                Spacer()
                Menu {
                    if case .success(let profile) = appState.profile,
                       profile.id == forum.writerId {
                        Button("수정하기", role: .cancel) {
                            router.navigate(to: CommunityDetailDestination.communityEdit(forumId: forum.communityId))
                        }
                        Button("신고하기", role: .destructive) {
                            showReportCommunityDialog = true
                        }
                        Button("삭제하기", role: .destructive) {
                            showRemoveCommunityDialog = true
                        }
                    } else {
                        Button("신고하기", role: .destructive) {
                            showReportCommunityDialog = true
                        }
                    }
                } label: {
                    Image(icon: .detailVertical)
                        .resizable()
                        .myIconColor(.textAlt)
                        .frame(size: 24)
                }
            }
            Text(LocalizedStringKey(forum.content))
                .applyOpenURL()
                .myFont(.bodyR)
                .myColor(.textNormal)
            if let link = links.first,
               let url = URL(string: link) {
                GrowLinkPreview(
                    url: url, 
                    openGraph: .init {
                        viewModel.community.data?.openGrpah
                    } set: {
                        viewModel.updateImageOpenGraph($0)
                    }
                )
            }
            MyLikeButton(
                like: forum.like,
                isLiked: forum.liked
            ) {
                await viewModel.patchLike()
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
            if case .success(let profile) = appState.profile {
                VStack(spacing: 4) {
                    ForEach(data, id: \.commentId) { comment in
                        GrowCommentCell(comment: comment, profileId: profile.id) {
                            showReportCommentDialog = true
                            viewModel.selectedReportComment = comment
                        } removeAction: {
                            showRemoveCommentDialog = true
                            viewModel.selectedRemoveComment = comment
                        }
                    }
                }
            }
        case .failure:
            EmptyView()
        }
    }
}
