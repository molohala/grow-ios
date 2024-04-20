import SwiftUI
import BaseFeature
import DesignSystem
import CommunityFeatureInterface
import CommunityServiceInterface

public struct CommunityView: View {
    
    @EnvironmentObject private var router: Router
    @State private var reader: ScrollViewProxy?
    @StateObject private var viewModel: CommunityViewModel
    
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
                                ShimmerCommunityCell()
                                    .shimmer()
                            }
                        } else {
                            ForEach(viewModel.communities, id: \.community.communityId) { community in
                                CommunityCell(
                                    community: community,
                                    likeAction: {
                                        Task {
                                            await viewModel.patchLike(communityId: community.community.communityId)
                                        }
                                    },
                                    editAction: {},
                                    removeAction: {}
                                ) {
                                    router.navigate(to: CommunityDestination.communityDetail(id: community.community.communityId))
                                }
                                .onAppear {
                                    guard let index = viewModel.communities.firstIndex(where: { $0.community.communityId == community.community.communityId }) else { return }
                                    
                                    if index % pagingInterval == (pagingInterval - 1) && index / pagingInterval == (viewModel.communities.count - 1) / pagingInterval {
                                        Task {
                                            await viewModel.fetchNextCommunities()
                                        }
                                    }
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
            Task {
                await viewModel.fetchCommunities()
            }
        }
        .task {
            await viewModel.fetchCommunities()
        }
    }
}
