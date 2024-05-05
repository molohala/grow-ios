import SwiftUI
import ProfileDetailFeatureInterface
import CommunityDetailFeatureInterface
import HomeFeatureInterface
import CommunityFeatureInterface
import CommunityEditFeatureInterface

public struct HomeCoordinator: View {
    
    private let communityDetailBuildable: any CommunityDetailBuildable
    private let profileDetailBuildable: any ProfileDetailBuildable
    private let communityEditBuildable: any CommunityEditBuildable
    private let viewModel: HomeViewModel
    
    public init(
        communityDetailBuildable: any CommunityDetailBuildable,
        profileDetailBuildable: any ProfileDetailBuildable,
        communityEditBuildable: any CommunityEditBuildable,
        viewModel: HomeViewModel
    ) {
        self.communityDetailBuildable = communityDetailBuildable
        self.profileDetailBuildable = profileDetailBuildable
        self.communityEditBuildable = communityEditBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        HomeView(
            viewModel: viewModel
        )
        .navigationDestination(for: HomeDestination.self) {
            switch $0 {
            case .communityDetail: communityDetailBuildable.makeView(id: viewModel.selectedCommunity?.community.communityId ?? -1).eraseToAnyView()
            case .profileDetail(let memberId): profileDetailBuildable.makeView(memberId: memberId).eraseToAnyView()
            case .communityEdit(let forumId): communityEditBuildable.makeView(forumId: forumId).eraseToAnyView()
            }
        }
    }
}
