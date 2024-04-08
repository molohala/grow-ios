import SwiftUI
import DesignSystem
import BaseFeature
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

public struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    @StateObject private var navController = NavController()
    
//    private let settingBuildable: any SettingBuildable
//    private let profileEditBuilable: any ProfileEditBuildable
//    private let profileDetailBuildable: any ProfileDetailBuildable
//    private let githubSettingBuildable: any GithubSettingBuildable
//    private let baekjoonSettingBuildable: any BaekjoonSettingBuildable
//    private let communityCreateBuildable: any CommunityCreateBuildable
//    private let communityDetailBuildable: any CommunityDetailBuildable
//    private let homeBuildable: any HomeBuildable
//    private let communityBuildable: any CommunityBuildable
//    private let githubRankBuildable: any GithubRankBuildable
//    private let baekjoonRankBuildable: any BaekjoonRankBuildable
//    private let profileBuildable: any ProfileBuildable
    
    public init(
//        settingBuildable: any SettingBuildable,
//        profileEditBuilable: any ProfileEditBuildable,
//        profileDetailBuildable: any ProfileDetailBuildable,
//        githubSettingBuildable: any GithubSettingBuildable,
//        baekjoonSettingBuildable: any BaekjoonSettingBuildable,
//        communityCreateBuildable: any CommunityCreateBuildable,
//        communityDetailBuildable: any CommunityDetailBuildable,
//        homeBuildable: any HomeBuildable,
//        communityBuildable: any CommunityBuildable,
//        githubRankBuildable: any GithubRankBuildable,
//        baekjoonRankBuildable: any BaekjoonRankBuildable,
//        profileBuildable: any ProfileBuildable
    ) {
//        self.settingBuildable = settingBuildable
//        self.profileEditBuilable = profileEditBuilable
//        self.profileDetailBuildable = profileDetailBuildable
//        self.githubSettingBuildable = githubSettingBuildable
//        self.baekjoonSettingBuildable = baekjoonSettingBuildable
//        self.communityCreateBuildable = communityCreateBuildable
//        self.communityDetailBuildable = communityDetailBuildable
//        self.homeBuildable = homeBuildable
//        self.communityBuildable = communityBuildable
//        self.githubRankBuildable = githubRankBuildable
//        self.baekjoonRankBuildable = baekjoonRankBuildable
//        self.profileBuildable = profileBuildable
    }
    
    public var body: some View {
        NavigationStack(path: $navController.path) {
            content
                .navigationTitle(viewModel.selectedView.title)
                .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
                .navigationDestination(for: ViewType.Main.self) { viewType in
                    switch viewType {
//                    case .setting: settingBuildable.makeView().eraseToAnyView()
//                    case .profileEdit: profileEditBuilable.makeView().eraseToAnyView()
//                    case .profileDetail: profileDetailBuildable.makeView().eraseToAnyView()
//                    case .githubSetting: githubSettingBuildable.makeView().eraseToAnyView()
//                    case .baekjoonSetting: baekjoonSettingBuildable.makeView().eraseToAnyView()
//                    case .jobSetting: EmptyView()
//                    case .communityCreate: communityCreateBuildable.makeView().eraseToAnyView()
//                    case .communityDetail: communityDetailBuildable.makeView().eraseToAnyView()
                    default: Text("")
                    }
                    Text("")
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        GeometryReader { proxy in
            ZStack {
//                switch viewModel.selectedView {
//                case .Home: homeBuildable.makeView().eraseToAnyView()
//                case .Community: communityBuildable.makeView().eraseToAnyView()
//                case .GithubRank: githubRankBuildable.makeView().eraseToAnyView()
//                case .BaekjoonRank: baekjoonRankBuildable.makeView().eraseToAnyView()
//                case .Profile: profileBuildable.makeView().eraseToAnyView()
//                }
                VStack {
                    Spacer()
                    InfinityTabView(selectedTab: $viewModel.selectedView, proxy: proxy)
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
