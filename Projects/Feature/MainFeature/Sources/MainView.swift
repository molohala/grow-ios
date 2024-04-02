import SwiftUI
import DesignSystem
import BaseFeature
import HomeFeature
import GithubRankFeature
import BaekjoonRankFeature
import ProfileFeature
import ProfileEditFeature
import CommunityFeature
import ProfileDetailFeature

public struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    @StateObject private var navController = NavController()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $navController.navigationPath) {
            content
                .backgroundColor(viewModel.selectedView.backgroundColor)
                .navigationDestination(for: ViewType.Main.self) { viewType in
                    switch viewType {
                    case .profileEdit: ProfileEditView()
                    case .profileDetail: ProfileDetailView()
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
                    navController.navigationPath.append(.profileEdit)
                } navigateToProfileDetail: {
                    navController.navigationPath.append(.profileDetail)
                }
                case .BaekjoonRank: BaekjoonRankView()
                case .Profile: ProfileView { navController.navigationPath.append(.profileEdit) }
                }
            }
            .navigationTitle(viewModel.selectedView.title)
            GeometryReader { reader in
                ZStack(alignment: .bottom) {
                    InfinityTabView(selectedTab: $viewModel.selectedView)
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
