import SwiftUI
import ProfileEditFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface
import SettingFeatureInterface
import BaseFeature
import BlockFeatureInterface

public struct SettingCoordinator: View {
    
    @EnvironmentObject private var appState: AppState
    
    private let profileEditBuildable: any ProfileEditBuildable
    private let githubSettingBuildable: any GithubSettingBuildable
    private let baekjoonSettingBuildable: any BaekjoonSettingBuildable
    private let blockBuildable: any BlockBuildable
    private let viewModel: SettingViewModel
    
    public init(
        profileEditBuildable: any ProfileEditBuildable,
        githubSettingBuildable: any GithubSettingBuildable,
        baekjoonSettingBuildable: any BaekjoonSettingBuildable,
        blockBuildable: any BlockBuildable,
        viewModel: SettingViewModel
    ) {
        self.profileEditBuildable = profileEditBuildable
        self.githubSettingBuildable = githubSettingBuildable
        self.baekjoonSettingBuildable = baekjoonSettingBuildable
        self.blockBuildable = blockBuildable
        self.viewModel = viewModel
    }
    
    public var body: some View {
        SettingView(
            viewModel: viewModel
        )
        .navigationDestination(for: SettingDestination.self) {
            switch $0 {
            case .baekjoonSetting: baekjoonSettingBuildable.makeView().eraseToAnyView()
            case .githubSetting: githubSettingBuildable.makeView().eraseToAnyView()
            case .profileEdit: profileEditBuildable.makeView().eraseToAnyView()
            case .block: blockBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
