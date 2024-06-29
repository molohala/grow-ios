import SwiftUI
import DesignSystem
import BaseFeature
import HomeFeatureInterface
import GithubRankFeatureInterface
import BaekjoonRankFeatureInterface
import ProfileFeatureInterface
import CommunityFeatureInterface
import MyDesignSystem

public struct MainView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @StateObject private var blockManager: BlockManager
    
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
        profileBuildable: any ProfileBuildable,
        blockManager: BlockManager
    ) {
        self.homeBuildable = homeBuildable
        self.communityBuildable = communityBuildable
        self.githubRankBuildable = githubRankBuildable
        self.baekjoonRankBuildable = baekjoonRankBuildable
        self.profileBuildable = profileBuildable
        self._blockManager = StateObject(wrappedValue: blockManager)
    }
    
    public var body: some View {
        NavigationStack(path: $router.navPath) {
            MyBottomTabBar(selectedTab: appState.selectedView, onTap: { tab in
                appState.selectedView = tab
            }) {
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
        .alert("차단 해제 실패", isPresented: $blockManager.allowFailure) {
            Button("확인", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("차단 해제 성공", isPresented: $blockManager.allowSuccess) {
            Button("닫기", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("유저 차단 실패", isPresented: $blockManager.blockFailure) {
            Button("확인", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("유저 차단 성공", isPresented: $blockManager.blockSuccess) {
            Button("닫기", role: .cancel) {}
        }
    }
}
