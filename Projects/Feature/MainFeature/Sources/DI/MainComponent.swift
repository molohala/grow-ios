import Foundation
import SwiftUI
import NeedleFoundation
import MainFeatureInterface
import HomeFeatureInterface
import GithubRankFeatureInterface
import BaekjoonRankFeatureInterface
import ProfileFeatureInterface
import SettingFeatureInterface
import CommunityFeatureInterface
import ProfileDetailFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface
import ProfileEditFeatureInterface
import CommunityCreateFeatureInterface
import CommunityDetailFeatureInterface
import BlockServiceInterface

public protocol MainDependency: Dependency {
    var homeBuildable: any HomeBuildable { get }
    var communityBuildable: any CommunityBuildable { get }
    var githubRankBuildable: any GithubRankBuildable { get }
    var baekjoonRankBuildable: any BaekjoonRankBuildable { get }
    var profileBuildable: any ProfileBuildable { get }
    var blockDomainBuildable: any BlockDomainBuildable { get }
}

public final class MainComponent: Component<MainDependency>, MainBuildable {
    public func makeView() -> some View {
        MainView(
            homeBuildable: dependency.homeBuildable,
            communityBuildable: dependency.communityBuildable,
            githubRankBuildable: dependency.githubRankBuildable,
            baekjoonRankBuildable: dependency.baekjoonRankBuildable,
            profileBuildable: dependency.profileBuildable,
            blockManager: .init(
                blockUseCase: dependency.blockDomainBuildable.blockUseCase,
                allowUseCase: dependency.blockDomainBuildable.allowUseCase,
                getAllBlockedUserUseCase: dependency.blockDomainBuildable.getAllBlockedUserUseCase
            )
        )
    }
}
