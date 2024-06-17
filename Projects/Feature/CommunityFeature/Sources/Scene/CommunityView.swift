import SwiftUI
import BaseFeature
import DesignSystem
import CommunityFeatureInterface
import CommunityServiceInterface
import MyDesignSystem

public struct CommunityView: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel: CommunityViewModel
    @State private var reader: ScrollViewProxy?
    @State private var showRemoveDialog = false
    @State private var showReportCommunityDialog = false
    
    public init(
        viewModel: CommunityViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
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
                            if case .success(let profile) = appState.profile {
                                ForEach(data, id: \.community.communityId) { community in
                                    GrowForumCell(
                                        forum: community,
                                        profileId: profile.id,
                                        likeAction: {
                                            await viewModel.patchLike(communityId: community.community.communityId)
                                        },
                                        removeAction: {
                                            viewModel.selectedRemoveCommunity = community
                                            showRemoveDialog = true
                                        },
                                        editAction: {
                                            router.navigate(to: CommunityDestination.communityEdit(forumId: community.community.communityId))
                                        },
                                        reportAction: {
                                            showReportCommunityDialog = true
                                            viewModel.selectedReportCommunity = community
                                        },
                                        action: {
                                            router.navigate(to: CommunityDestination.communityDetail(id: community.community.communityId))
                                        })
                                    .task {
                                        guard let index = data.firstIndex(where: { $0.community.communityId == community.community.communityId }) else { return }
                                        
                                        if index % pagingInterval == (pagingInterval - 1) && index / pagingInterval == (data.count - 1) / pagingInterval {
                                            await viewModel.fetchNextCommunities()
                                        }
                                    }
                                }
                                Spacer().frame(height: 92)
                            }
                        case .failure:
                            EmptyView()
                        }
                    }
                    .padding(.horizontal, 16)
                    .onAppear {
                        self.reader = reader
                    }
                    .id("lazyvstack")
                }
                .refreshable {
                    Task {
                        await viewModel.fetchCommunities()
                    }
                }
            }
            MyButton(
                "글쓰기",
                type: .Large,
                leadingIcon: .write,
                isRounded: true
            ) {
                router.navigate(to: CommunityDestination.communityCreate)
            }
            .padding(.trailing, 16)
            .padding(.bottom, 72)
            .toBottom()
            .toTrailing()
        }
        .myTopBar("포럼", background: .backgroundAlt)
        .task {
            await viewModel.fetchCommunities()
        }
        .alert("게시글 삭제에 실패했습니다", isPresented: .init(
            get: { viewModel.removedCommunityFlow == .failure },
            set: { _ in viewModel.removedCommunityFlow = .fetching }
        )) {
            Button("확인", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("게시글 삭제 성공", isPresented: .init {
            viewModel.removedCommunityFlow == .success(true)
        } set: { _ in
            viewModel.removedCommunityFlow = .fetching
        }) {
            Button("닫기", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("정말 게시글을 삭제 하시겠습니까?", isPresented: $showRemoveDialog) {
            Button("아니요", role: .cancel) {}
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeCommunity()
                    await viewModel.fetchCommunities()
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
}
