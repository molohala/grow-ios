import SwiftUI
import SettingFeatureInterface

import BaseFeature

import DesignSystem

public struct SettingView: View {
    
    @ObservedObject private var viewModel: SettingViewModel
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appState: AppState
    
    public init(
        viewModel: SettingViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            if case .success(let profile) = appState.profile,
               let githubId = profile.socialAccounts.first(where: { $0.socialType == .GITHUB }),
               let baekjoonId = profile.socialAccounts.first(where: { $0.socialType == .SOLVED_AC }) {
                
                SettingCell(icon: Image(systemName: "person.fill"),
                            iconColor: .gray,
                            text: "프로필 설정") {
                    router.navigate(to: SettingDestination.profileEdit)
                }
                SettingCell(icon: DesignSystemAsset.github.swiftUIImage,
                            iconColor: .github,
                            text: "Github 설정",
                            description: githubId.socialId) {
                    router.navigate(to: SettingDestination.githubSetting)
                }
                SettingCell(icon: DesignSystemAsset.baekjoon.swiftUIImage,
                            iconColor: .baekjoon,
                            text: "백준 설정",
                            description: baekjoonId.socialId) {
                    router.navigate(to: SettingDestination.baekjoonSetting)
                }
            }
            Spacer()
            logout
                .padding(.bottom, 24)
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .background(Color.backgroundColor)
        .growTopBar("설정", background: .backgroundColor)
    }
    
    @ViewBuilder
    private var logout: some View {
        Button {
            appState.accessToken = ""
            appState.refreshToken = ""
        } label: {
            HStack {
                Text("로그아웃")
                    .growFont(.body)
                    .foregroundStyle(.red)
                    .fontWeight(.medium)
                    .padding(4)
                Spacer()
                Icon.logoutIcon
            }
            .applyCardView()
        }
        .applyAnimation()
    }
}
