import SwiftUI

import BaseFeature
import ProfileEditFeatureInterface
import GithubSettingFeatureInterface
import BaekjoonSettingFeatureInterface
import SettingFeatureInterface

import DesignSystem

public struct SettingView: View {
    
    @ObservedObject private var viewModel = SettingViewModel()
    @EnvironmentObject private var router: Router
    
    private let profileEditBuildable: any ProfileEditBuildable
    private let githubSettingBuildable: any GithubSettingBuildable
    private let baekjoonSettingBuildable: any BaekjoonSettingBuildable
    
    public init(
        profileEditBuildable: any ProfileEditBuildable,
        githubSettingBuildable: any GithubSettingBuildable,
        baekjoonSettingBuildable: any BaekjoonSettingBuildable
    ) {
        self.profileEditBuildable = profileEditBuildable
        self.githubSettingBuildable = githubSettingBuildable
        self.baekjoonSettingBuildable = baekjoonSettingBuildable
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                SettingCell(icon: Image(systemName: "person.fill"),
                            iconColor: .gray,
                            text: "프로필 설정") {
                    router.navigate(to: SettingDestination.profileEdit)
                }
                SettingCell(icon: DesignSystemAsset.github.swiftUIImage,
                            iconColor: .github,
                            text: "Github 설정",
                            description: "bestswlkh0310") {
                    router.navigate(to: SettingDestination.githubSetting)
                }
                SettingCell(icon: DesignSystemAsset.baekjoon.swiftUIImage,
                            iconColor: .baekjoon,
                            text: "백준 설정",
                            description: "hhhello0507") {
                    router.navigate(to: SettingDestination.baekjoonSetting)
                }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .background(Color.backgroundColor)
        .infinityTopBar("설정", background: .backgroundColor)
        .navigationDestination(for: SettingDestination.self) {
            switch $0 {
            case .baekjoonSetting: baekjoonSettingBuildable.makeView().eraseToAnyView()
            case .githubSetting: githubSettingBuildable.makeView().eraseToAnyView()
            case .profileEdit: profileEditBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
