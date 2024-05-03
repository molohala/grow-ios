import BaseFeature
import SwiftUI
import CommunityDetailFeatureInterface
import DesignSystem
import CommunityServiceInterface
import Pow
import CommentServiceInterface

public struct CommunityDetailView: View {
    
    @StateObject private var viewModel: CommunityDetailViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @State private var reader: ScrollViewProxy?
    
    public init(
        viewModel: CommunityDetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollViewReader { reader in
                ScrollView {
                    EmptyView()
                        .id("top")
                    switch viewModel.community {
                    case .fetching:
                        ShimmerCommunityDetailCell()
                            .shimmer()
                    case .success(let data):
                        VStack(alignment: .leading, spacing: 16) {
                            profile(data)
                            Text(LocalizedStringKey(data.content))
                                .font(.callout)
                                .applyOpenURL()
                            info(data)
                            Divider()
                            self.comments
                                .padding(.bottom, 64)
                        }
                        .padding(.horizontal, 16)
                        .onAppear {
                            self.reader = reader
                        }
                    case .failure:
                        Text("불러오기 실패")
                    }
                }
            }
            VStack(spacing: 0) {
                Spacer()
                Divider()
                HStack {
                    TextField("댓글을 남겨보세요", text: $viewModel.currentComment)
                        .padding(8)
                        .font(.body)
                    Button {
                        Task {
                            await viewModel.createComment()
                            guard let reader else { return }
                            guard case .success = viewModel.comments else { return }
                            
                            reader.scrollTo("top", anchor: .top)
                        }
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .renderingMode(.template)
                            .font(.title)
                            .foregroundStyle(viewModel.currentComment.isEmpty ? Color.gray400 : Color.blue500)
                            .padding(4)
                    }
                    .disabled(viewModel.currentComment.isEmpty)
                }
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
               isPresented: .init(get: { viewModel.showRemovingCommunity },
                                  set: { _ in
            viewModel.showRemovingCommunity = false
        })) {
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeCommuntiy()
                }
            }
            Button("아니요", role: .cancel) {}
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
            
            if case .success(let community) = viewModel.community {
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
    private var comments: some View {
        switch viewModel.comments {
        case .success(let data):
            LazyVStack(spacing: 20) {
                ForEach(data, id: \.commentId) { comment in
                    CommentCell(comment: comment) {
                        viewModel.selectedRemovingComment = comment
                        viewModel.showRemovingComment = true
                    }
                }
            }
        default:
            EmptyView()
        }
    }
}
