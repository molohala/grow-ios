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

public struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    @StateObject private var navController = NavController()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $navController.path) {
            content
                .backgroundColor(viewModel.selectedView.backgroundColor)
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
                    default: Text("")
                    }
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ZStack {
            Group {
                switch viewModel.selectedView {
                case .Home: HomeView()
                case .Community: CommunityView()
                case .GithubRank: GithubRankView {
                    navController.path.append(.githubSetting)
                } navigateToProfileDetail: {
                    navController.path.append(.profileDetail)
                }
                case .BaekjoonRank: BaekjoonRankView()
                case .Profile: ProfileView { navController.path.append(.setting) }
                }
            }
            .navigationTitle(viewModel.selectedView.title)
            GeometryReader { reader in
                ZStack(alignment: .bottom) {
                    InfinityTabView(selectedTab: $viewModel.selectedView, proxy: reader)
                        .shadow(color: Color.black.opacity(0.04), radius: 12)
                    VStack {
                        Color.white
                            .frame(height: reader.safeAreaInsets.top, alignment: .top)
                        Spacer()
                        Color.white
                            .frame(height: reader.safeAreaInsets.bottom, alignment: .bottom)
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}
