import SwiftUI
import DesignSystem
import BaseFeature
import HomeFeature
import GithubRankFeature
import BaekjoonRankFeature
import ProfileFeature

public struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    @StateObject private var navController = NavController()
    
    public init() {}
    
    public var body: some View {
        NavigationStack(path: $navController.navigationPath) {
            content
                .toolbarBackground(viewModel.selectedView.toolbarColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationDestination(for: ViewType.Main.self) { viewType in
                    switch viewType {
                    default: Text("")
                    }
                }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ZStack {
            viewModel.selectedView.view
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
