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

public protocol HomeDependency: Dependency {
    var profileDetailBuildable: any ProfileDetailBuildable { get }
    var communityDetailBuildable: any CommunityDetailBuildable { get }
    var profileBuildable: any ProfileBuildable { get }
    var communityBuildable: any CommunityBuildable { get }
    var rankDomainBuildable: any RankDomainBuildable { get }
    var communityDomainBuildable: any CommunityDomainBuildable { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeBuildable {
    public func makeView() -> some View {
        HomeCoordinator(
            communityDetailBuildable: dependency.communityDetailBuildable,
            profileDetailBuildable: dependency.profileDetailBuildable,
            viewModel: .init(
                getTodayGithubRankUseCase: dependency.rankDomainBuildable.getTodayGithubRankUseCase,
                getTodaySolvedacRankUseCase: dependency.rankDomainBuildable.getTodaySolvedacRankUseCase,
                getBestCommunitiesUseCase: dependency.communityDomainBuildable.getBestCommunitiesUseCase
            )
        )
    }
}
