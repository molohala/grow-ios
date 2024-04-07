import SwiftUI
import DesignSystem
import BaseFeature
import HomeFeature
import GithubRankFeature
import BaekjoonRankFeature
import ProfileFeature
import SettingFeature
import CommunityFeature
import ProfileDetailFeature
import GithubSettingFeature
import BaekjoonSettingFeature
import ProfileEditFeature
import CommunityCreateFeature
import CommunityDetailFeature

public struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    @StateObject private var navController = NavController()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $navController.path) {
            content
                .navigationTitle(viewModel.selectedView.title)
                .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
                .navigationDestination(for: ViewType.Main.self) { viewType in
                    switch viewType {
                    case .setting: SettingView(
                        navigateToProfileEdit: {
                            navController.path.append(.profileEdit)
                        },
                        navigateToGithubSetting: {
                            navController.path.append(.githubSetting)
                        }, navigateToBaekjoonSetting: {
                            navController.path.append(.baekjoonSetting)
                        }, navigateToJobSetting: {
                            navController.path.append(.jobSetting)
                        }
                    )
                    case .profileEdit: ProfileEditView()
                    case .profileDetail: ProfileDetailView()
                    case .githubSetting: GithubSettingView()
                    case .baekjoonSetting: BaekjoonSettingView()
                    case .jobSetting: EmptyView()
                    case .communityCreate: CommunityCreateView()
                    case .communityDetail: CommunityDetailView()
                    default: Text("")
                    }
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        GeometryReader { proxy in
            ZStack {
                switch viewModel.selectedView {
                case .Home: HomeView(
                    navigateToCommunityDetail: {
                        navController.path.append(.communityDetail)
                    },
                    navigateToProfileDetail: {
                        navController.path.append(.profileDetail)
                    }
                )
                case .Community: CommunityView(
                    navigateToCommunityCreate: {
                        navController.path.append(.communityCreate)
                    }, navigateToCommunityDetail: {
                        navController.path.append(.communityDetail)
                    }
                )
                case .GithubRank: GithubRankView {
                    navController.path.append(.githubSetting)
                } navigateToProfileDetail: {
                    navController.path.append(.profileDetail)
                }
                case .BaekjoonRank: BaekjoonRankView()
                case .Profile: ProfileView { navController.path.append(.setting) }
                }
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
