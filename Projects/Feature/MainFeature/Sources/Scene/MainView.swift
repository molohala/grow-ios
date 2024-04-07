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
    
    private let settingBuildable: any SettingBuildable
    private let profileEditBuilable: any ProfileEditBuildable
    private let profileDetailBuildable: any ProfileDetailBuildable
    private let githubSettingBuildable: any GithubSettingBuildable
    
    public var body: some View {
        NavigationStack(path: $navController.path) {
            content
                .navigationTitle(viewModel.selectedView.title)
                .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
                .navigationDestination(for: ViewType.Main.self) { viewType in
//                    switch viewType {
//                    case .setting: SettingView(
//                    case .profileEdit: ProfileEditView()
//                    case .profileDetail: ProfileDetailView()
//                    case .githubSetting: GithubSettingView()
//                    case .baekjoonSetting: BaekjoonSettingView()
//                    case .jobSetting: EmptyView()
//                    case .communityCreate: CommunityCreateView()
//                    case .communityDetail: CommunityDetailView()
//                    default: Text("")
//                    }
                    Text("HElo")
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        GeometryReader { proxy in
            ZStack {
//                switch viewModel.selectedView {
//                case .Home: HomeView(
//                    navigateToCommunityDetail: {
//                        navController.path.append(.communityDetail)
//                    },
//                    navigateToProfileDetail: {
//                        navController.path.append(.profileDetail)
//                    }
//                )
//                case .Community: CommunityView(
//                    navigateToCommunityCreate: {
//                        navController.path.append(.communityCreate)
//                    }, navigateToCommunityDetail: {
//                        navController.path.append(.communityDetail)
//                    }
//                )
//                case .GithubRank: GithubRankView {
//                    navController.path.append(.githubSetting)
//                } navigateToProfileDetail: {
//                    navController.path.append(.profileDetail)
//                }
//                case .BaekjoonRank: BaekjoonRankView()
//                case .Profile: ProfileView { navController.path.append(.setting) }
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
