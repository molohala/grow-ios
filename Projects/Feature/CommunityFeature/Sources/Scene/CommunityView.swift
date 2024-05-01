import SwiftUI
import BaseFeature
import DesignSystem
import CommunityFeatureInterface
import CommunityServiceInterface

public struct CommunityView: View {
    
    @EnvironmentObject private var router: Router
    @State private var reader: ScrollViewProxy?
    @StateObject private var viewModel: CommunityViewModel
    @EnvironmentObject private var appState: AppState
    
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
                        if viewModel.isfetchingCommunities {
                            ForEach(0..<4, id: \.self) { _ in
                                CommunityCellShimmer()
                                    .shimmer()
                            }
                        } else {
                            ForEach(viewModel.communities, id: \.community.communityId) { community in
                                CommunityCell(
                                    community: community,
                                    likeAction: {
                                        viewModel.patchLike(communityId: community.community.communityId)
                                    },
                                    editAction: {
                                        router.navigate(to: CommunityDestination.communityEdit(communityContent: community.community))
                                    },
                                    removeAction: {
                                        viewModel.removedCommunity = community
                                        viewModel.removedCommunityFlow = .checking
                                    }
                                ) {
                                    router.navigate(to: CommunityDestination.communityDetail(id: community.community.communityId))
                                }
                                .onAppear {
                                    guard let index = viewModel.communities.firstIndex(where: { $0.community.communityId == community.community.communityId }) else { return }
                                    
                                    if index % pagingInterval == (pagingInterval - 1) && index / pagingInterval == (viewModel.communities.count - 1) / pagingInterval {
                                        viewModel.fetchNextCommunities()
                                    }
                                }
                                .alert("정말 게시글을 삭제 하시겠습니까?", isPresented: .init(
                                    get: { viewModel.removedCommunityFlow == .checking },
                                    set: { _ in
                                        viewModel.removeCommunity()
                                        viewModel.fetchCommunities()
                                    }
                                )) {
                                    Button("아니요", role: .cancel) {}
                                    Button("삭제", role: .destructive) {}
                                }
                            }
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
                        viewModel.removedCommunityFlow == .success
                    } set: { _ in
                        viewModel.removedCommunityFlow = .idle
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
                            .foregroundStyle(Color.blue500)
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
        .background(Color.backgroundColor)
        .refreshable {
            viewModel.fetchCommunities()
        }
        .onAppear {
            viewModel.fetchCommunities()
        }
        .alert("게시글 삭제에 실패했습니다", isPresented: .init(
            get: { viewModel.removedCommunityFlow == .failure },
            set: { _ in viewModel.removedCommunityFlow = .idle }
        )) {
            Button("확인", role: .cancel) {}
        }
    }
}
