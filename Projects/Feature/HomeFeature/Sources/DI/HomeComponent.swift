import Foundation
import SwiftUI
import NeedleFoundation
import HomeFeatureInterface
import ProfileDetailFeatureInterface
import CommunityDetailFeatureInterface
import ProfileFeatureInterface
import CommunityFeatureInterface
import RankServiceInterface
import CommunityServiceInterface
import LikeServiceInterface
import CommunityEditFeatureInterface

public protocol HomeDependency: Dependency {
    var profileDetailBuildable: any ProfileDetailBuildable { get }
    var communityDetailBuildable: any CommunityDetailBuildable { get }
    var profileBuildable: any ProfileBuildable { get }
    var communityBuildable: any CommunityBuildable { get }
    var rankDomainBuildable: any RankDomainBuildable { get }
    var communityDomainBuildable: any CommunityDomainBuildable { get }
    var likeDomainBuildable: any LikeDomainBuildable { get }
    var communityEditBuildable: any CommunityEditBuildable { get}
}

public final class HomeComponent: Component<HomeDependency>, HomeBuildable {    
    public func makeView() -> some View {
        HomeCoordinator(
            communityDetailBuildable: dependency.communityDetailBuildable,
            profileDetailBuildable: dependency.profileDetailBuildable, 
            communityEditBuildable: dependency.communityEditBuildable,
            viewModel: .init(
                getTodayGithubRankUseCase: dependency.rankDomainBuildable.getTodayGithubRankUseCase,
                getTodaySolvedacRankUseCase: dependency.rankDomainBuildable.getTodaySolvedacRankUseCase,
                getBestCommunitiesUseCase: dependency.communityDomainBuildable.getBestCommunitiesUseCase,
                patchLikeUseCase: dependency.likeDomainBuildable.patchLikeUseCase,
                removeCommunityUseCase: dependency.communityDomainBuildable.removeCommunityUseCase
            )
        )
    }
}
