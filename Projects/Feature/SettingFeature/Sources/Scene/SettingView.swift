import SwiftUI
import SettingFeatureInterface

import BaseFeature

import DesignSystem

public struct SettingView: View {
    
    @ObservedObject private var viewModel: SettingViewModel
    @EnvironmentObject private var router: Router
    
    public init(
        viewModel: SettingViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
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
    }
}
