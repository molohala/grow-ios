import SwiftUI

import BaseFeature

import DesignSystem

public struct SettingView: View {
    
    @ObservedObject private var viewModel = SettingViewModel()
    
    private var navigateToProfileEdit: () -> Void
    private var navigateToGithubSetting: () -> Void
    private var navigateToBaekjoonSetting: () -> Void
    private var navigateToJobSetting: () -> Void
    
    public init(
        navigateToProfileEdit: @escaping () -> Void,
        navigateToGithubSetting: @escaping () -> Void,
        navigateToBaekjoonSetting: @escaping () -> Void,
        navigateToJobSetting: @escaping () -> Void
    ) {
        self.navigateToProfileEdit = navigateToProfileEdit
        self.navigateToGithubSetting = navigateToGithubSetting
        self.navigateToBaekjoonSetting = navigateToBaekjoonSetting
        self.navigateToJobSetting = navigateToJobSetting
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                SettingCell(icon: Image(systemName: "person.fill"),
                            iconColor: .gray,
                            text: "프로필 설정") {
                    navigateToProfileEdit()
                }
                SettingCell(icon: DesignSystemAsset.github.swiftUIImage,
                            iconColor: .github,
                            text: "Github 설정",
                            description: "bestswlkh0310") {
                    navigateToGithubSetting()
                }
                SettingCell(icon: DesignSystemAsset.baekjoon.swiftUIImage,
                            iconColor: .baekjoon,
                            text: "백준 설정",
                            description: "hhhello0507") {
                    navigateToBaekjoonSetting()
                }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .navigationTitle("설정")
    }
}
