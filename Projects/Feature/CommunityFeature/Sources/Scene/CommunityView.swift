import SwiftUI
import BaseFeature
import DesignSystem
import CommunityFeatureInterface
import CommunityServiceInterface

public struct CommunityView: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel: CommunityViewModel
    @State private var reader: ScrollViewProxy?
    @State private var showRemoveDialog = false
    
    public init(
        viewModel: CommunityViewModel
    ) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollViewReader { reader in
                ScrollView {
                    LazyVStack(spacing: 8) {
                        switch viewModel.communities {
                        case .fetching:
                            ForEach(0..<4, id: \.self) { _ in
                                GrowForumCellShimmer()
                                    .shimmer()
                            }
                        case .success(let data):
                            ForEach(data, id: \.community.communityId) { community in
//                                GrowForumCell(
//                                    forum: community,
//                                    likeAction: {
//                                        await viewModel.patchLike(communityId: community.community.communityId)
//                                    },
//                                    editAction: {
//                                        router.navigate(to: CommunityDestination.communityEdit(forumId: community.community.communityId))
//                                    },
//                                    removeAction: {
//                                        viewModel.selectedRemoveCommunity = community
//                                        showRemoveDialog = true
//                                    }
//                                ) {
//                                    router.navigate(to: CommunityDestination.communityDetail(id: community.community.communityId))
//                                }
//                                .task {
//                                    guard let index = data.firstIndex(where: { $0.community.communityId == community.community.communityId }) else { return }
//                                    
//                                    if index % pagingInterval == (pagingInterval - 1) && index / pagingInterval == (data.count - 1) / pagingInterval {
//                                        await viewModel.fetchNextCommunities()
//                                    }
//                                }
//                                .alert("정말 게시글을 삭제 하시겠습니까?", isPresented: $showRemoveDialog) {
//                                    Button("아니요", role: .cancel) {}
//                                    Button("삭제", role: .destructive) {
//                                        Task {
//                                            await viewModel.removeCommunity()
//                                            await viewModel.fetchCommunities()
//                                        }
//                                    }
//                                }
                            }
                        case .failure:
                            Text("불러오기 실패")
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 128)
                    .onAppear {
                        self.reader = reader
                    }
                    .id("lazyvstack")
                    .alert("게시글 삭제 성공", isPresented: .init {
                        viewModel.removedCommunityFlow == .success(true)
                    } set: { _ in
                        viewModel.removedCommunityFlow = .fetching
                    }) {
                        Button("닫기", role: .cancel) {}
                    }
                }
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        router.navigate(to: CommunityDestination.communityCreate)
                    } label: {
                        Circle()
                            .frame(width: 64, height: 64)
//                            .foregroundStyle(Color.blue500)
                            .overlay {
                                Image(systemName: "square.and.pencil")
                                    .foregroundStyle(.white)
                            }
                    }
                    .applyAnimation()
                    .padding(.trailing, 24)
                    .padding(.bottom, 92)
                }
            }
        }
//        .background(Color.backgroundColor)
        .refreshable {
            Task {
                await viewModel.fetchCommunities()
            }
        }
        .task {
            await viewModel.fetchCommunities()
        }
        .alert("게시글 삭제에 실패했습니다", isPresented: .init(
            get: { viewModel.removedCommunityFlow == .failure },
            set: { _ in viewModel.removedCommunityFlow = .fetching }
        )) {
            Button("확인", role: .cancel) {}
        }
    }
}
