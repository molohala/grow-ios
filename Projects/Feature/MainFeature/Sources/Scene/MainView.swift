import SwiftUI
import DesignSystem
import BaseFeature
import HomeFeatureInterface
import GithubRankFeatureInterface
import BaekjoonRankFeatureInterface
import ProfileFeatureInterface
import CommunityFeatureInterface

public struct MainView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    
    private let homeBuildable: any HomeBuildable
    private let communityBuildable: any CommunityBuildable
    private let githubRankBuildable: any GithubRankBuildable
    private let baekjoonRankBuildable: any BaekjoonRankBuildable
    private let profileBuildable: any ProfileBuildable
    
    public init(
        homeBuildable: any HomeBuildable,
        communityBuildable: any CommunityBuildable,
        githubRankBuildable: any GithubRankBuildable,
        baekjoonRankBuildable: any BaekjoonRankBuildable,
        profileBuildable: any ProfileBuildable
    ) {
        self.homeBuildable = homeBuildable
        self.communityBuildable = communityBuildable
        self.githubRankBuildable = githubRankBuildable
        self.baekjoonRankBuildable = baekjoonRankBuildable
        self.profileBuildable = profileBuildable
    }
    
    public var body: some View {
        NavigationStack(path: $router.navPath) {
            GrowBottomTabBar(selectedTab: $appState.selectedView) {
                switch appState.selectedView {
                case .Home: homeBuildable.makeView().eraseToAnyView()
                case .Forum: communityBuildable.makeView().eraseToAnyView()
                case .GithubRank: githubRankBuildable.makeView().eraseToAnyView()
                case .BaekjoonRank: baekjoonRankBuildable.makeView().eraseToAnyView()
                case .Profile: profileBuildable.makeView().eraseToAnyView()
                }
            }
        }
        .task {
            await appState.fetchProfile()
        }
    }
}
