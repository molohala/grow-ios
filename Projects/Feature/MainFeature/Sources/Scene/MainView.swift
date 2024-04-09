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
            content
                .infinityTopBar(appState.selectedView.title, background: appState.selectedView.backgroundColor, hideBackButton: true)
                .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
        }
    }
    
    @ViewBuilder
    private var content: some View {
        GeometryReader { proxy in
            ZStack {
                switch appState.selectedView {
                case .Home: homeBuildable.makeView().eraseToAnyView()
                case .Community: communityBuildable.makeView().eraseToAnyView()
                case .GithubRank: githubRankBuildable.makeView().eraseToAnyView()
                case .BaekjoonRank: baekjoonRankBuildable.makeView().eraseToAnyView()
                case .Profile: profileBuildable.makeView().eraseToAnyView()
                }
                VStack {
                    Spacer()
                    InfinityTabView(selectedTab: $appState.selectedView, proxy: proxy)
                        .shadow(color: Color.black.opacity(0.04), radius: 12)
                }
                VStack {
                    Spacer()
                    Color.white
                        .frame(height: proxy.safeAreaInsets.bottom, alignment: .bottom)
                }
                .ignoresSafeArea()
            }
        }
    }
}
