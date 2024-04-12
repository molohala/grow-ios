import SwiftUI
import BaseFeature
import DesignSystem
import CommunityFeatureInterface

public struct CommunityView: View {
    
    @EnvironmentObject private var router: Router
    @ObservedObject private var viewModel: CommunityViewModel
    
    public init(
        viewModel: CommunityViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.communities, id: \.communityId) { community in
                        CommunityCell(
                            community: community,
                            likeAction: {
                                Task {
                                    await viewModel.patchLike(communityId: community.communityId)
                                }
                            },
                            commentAction: {},
                            detailAction: {}
                        ) {
                            router.navigate(to: CommunityDestination.communityDetail)
                        }
                        .padding(.horizontal, 16)
                        .onAppear {
                            guard let index = viewModel.communities.firstIndex(where: { $0.communityId == community.communityId }) else { return }
                            
                            if index % pagingInterval == (pagingInterval - 1) {
                                Task {
                                    await viewModel.fetchNextCommunities()
                                }
                            }
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 128)
            }
            .refreshable {
                await viewModel.fetchCommunities()
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
                            .foregroundStyle(.blue)
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
        .task {
            await viewModel.fetchCommunities()
        }
    }
}
