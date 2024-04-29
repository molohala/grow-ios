import BaseFeature
import SwiftUI
import CommunityDetailFeatureInterface
import DesignSystem
import CommunityServiceInterface
import Pow
import CommentServiceInterface

public struct CommunityDetailView: View {
    
    @State private var reader: ScrollViewProxy?
    
    @StateObject private var viewModel: CommunityDetailViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    
    public init(
        viewModel: CommunityDetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollViewReader { reader in
                ScrollView {
                    if viewModel.communityFlow == .success,
                       let community = viewModel.community,
                       viewModel.commentFlow == .success,
                       let comments = viewModel.comments {
                        VStack(alignment: .leading, spacing: 16) {
                            profile(community)
                            TextWrapper(community.content, font: .callout)
                            info(community)
                            Divider()
                            self.makeComments(comments)
                                .padding(.bottom, 64)
                        }
                        .padding(.horizontal, 16)
                        .onAppear {
                            self.reader = reader
                        }
                    } else {
                        ShimmerCommunityDetailCell()
                            .shimmer()
                    }
                }
                .alert("게시글을 삭제하시겠습니까?", 
                       isPresented: .init(get: { viewModel.showRemovingCommunity },
                                          set: { _ in
                    viewModel.showRemovingCommunity = false
                    Task {
                        await viewModel.removeCommuntiy()
                    }
                })) {
                    Button("삭제", role: .destructive) {}
                    Button("아니요", role: .cancel) {}
                }
                .refreshable {
                    Task {
                        async let fetchCommunity: () = viewModel.fetchCommunity()
                        async let fetchComments: () = viewModel.fetchComments()
                        _ = await [fetchCommunity, fetchComments]
                    }
                }
            }
            VStack(spacing: 0) {
                Spacer()
                Divider()
                HStack {
                    TextField("댓글을 남겨보세요", text: $viewModel.comment)
                        .padding(8)
                        .font(.body)
                    Button {
                        Task {
                            await viewModel.createComment()
                            guard let reader else { return }
                            guard let first = viewModel.comments?.first else { return }
                            
                            withAnimation {
                                reader.scrollTo(first.commentId, anchor: .top)
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .renderingMode(.template)
                            .font(.title)
                            .foregroundStyle(viewModel.comment.isEmpty ? Color.gray400 : Color.blue500)
                    }
                    .disabled(viewModel.comment.isEmpty)
                }
                .padding(.horizontal, 8)
                .padding(8)
                .background(Color.white)
            }
        }
        .background(Color.white)
        .hideKeyboardWhenTap()
        .infinityTopBar("")
        .task {
            async let fetchCommunity: () = viewModel.fetchCommunity()
            async let fetchComment: () = viewModel.fetchComments()
            _ = await (fetchCommunity, fetchComment)
        }
        .alert(
            "게시글을 불러올 수 없습니다",
            isPresented: .init(
                get: { viewModel.commentFlow == .failure || viewModel.commentFlow == .failure },
                set: { _ in dismiss() }
            )
        ) {
            Button("확인", role: .cancel) {
                dismiss()
            }
        }
        .onChange(of: viewModel.removeCommunityFlow) {
            if $0 == .success {
                dismiss()
            }
        }
    }
    
    @ViewBuilder
    func profile(_ c: CommunityContent) -> some View {
        HStack(spacing: 0) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 36, height: 36)
            VStack(alignment: .leading, spacing: 2) {
                Text(c.writerName)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 8)
                Text(c.createdAt.timeAgo)
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.leading, 4)
            }
            Spacer()
            
            if let profile = appState.profile,
               let community = viewModel.community {
                Menu {
                    Button("수정하기") { router.navigate(to: CommunityDetailDestination.communityEdit(communityContent: community)) }
                    Button("삭제하기", role: .destructive) { viewModel.showRemovingCommunity = true }
                } label: {
                    DesignSystemAsset.detailVerticalLine.swiftUIImage
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func info(_ c: CommunityContent) -> some View {
        HStack {
            Button {
                Task {
                    await viewModel.patchLike()
                }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: c.liked ? "heart.fill" : "heart")
                        .font(Font.title3)
                        .foregroundStyle(c.liked ? Color.red400 : Color.gray500)
                    Text("\(c.like)")
                        .font(.callout)
                        .foregroundStyle(c.liked ? Color.red400 : Color.gray500)
                }
                .padding(6)
                .background(c.liked ? Color.red100 : .white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay {
                    EmptyView()
                        .changeEffect(
                            .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                                if c.liked {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            },
                            value: c.liked
                        )
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func makeComments(_ comments: [Comment]) -> some View {
        LazyVStack(spacing: 20) {
            ForEach(comments, id: \.commentId) { comment in
                CommentCell(comment: comment) {
                    viewModel.selectedRemovingComment = comment
                    viewModel.showRemovingComment = true
                }
            }
        }
        .alert("댓글을 삭제하시겠습니까?",
               isPresented: .init(get: { viewModel.showRemovingComment },
                                  set: { _ in
            viewModel.showRemovingComment = false
            Task {
                await viewModel.removeComment()
            }
        })) {
            Button("삭제", role: .destructive) {}
            Button("아니요", role: .cancel) {}
        }
    }
}
