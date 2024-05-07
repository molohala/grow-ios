import SwiftUI
import SettingFeatureInterface
import SwiftUtil

import BaseFeature

import DesignSystem

public struct SettingView: View {
    
    @StateObject private var viewModel: SettingViewModel
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var colorProvider: ColorProvider
    
    public init(
        viewModel: SettingViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        LazyVStack(spacing: 20) {
            VStack(spacing: 12) {
                if case .success(let profile) = appState.profile {
                    GrowSettingCell(
                        label: "프로필 설정",
                        leftIcon: .person,
                        description: profile.name
                    ) {
                        router.navigate(to: SettingDestination.profileEdit)
                    }
                    GrowSettingCell(
                        label: "Github 설정",
                        leftIcon: .github,
                        description: profile.githubId
                    ) {
                        router.navigate(to: SettingDestination.githubSetting)
                    }
                    let baekjoon = profile.socialAccounts.first(where: { $0.socialType == .SOLVED_AC })
                    GrowSettingCell(
                        label: "백준 설정",
                        leftIcon: .baekjoon,
                        description: profile.baekjoonId
                    ) {
                        router.navigate(to: SettingDestination.baekjoonSetting)
                    }
                }
            }
            GrowDivider()
            VStack(spacing: 12) {
                GrowSettingCell(
                    label: "알림 허용",
                    leftIcon: .notification,
                    content: {
                        GrowToggle(isOn: .constant(true))
                    }
                )
                GrowSettingCell(
                    label: "다크모드",
                    leftIcon: .moon,
                    content: {
                        GrowToggle(isOn: .init(get: {
                            colorProvider.isDarkTheme
                        }, set: { bool in
                            colorProvider.isDarkTheme = bool
                        }))
                    }
                )
            }
            GrowDivider()
            VStack(spacing: 12) {
                GrowSettingCell(
                    label: "로그아웃",
                    action: {
                        // action
                    }
                )
                GrowSettingCell(
                    label: "회원탈퇴",
                    labelColor: .textWarning,
                    action: {
                        // action
                    }
                )
            }
            VStack(spacing: 16) {
                Text("버전 - \(version ?? "")")
                    .growFont(.labelM)
                    .growColor(.textAlt)
                Text("개인정보 이용 약관")
                    .growFont(.labelM)
                    .growColor(.textAlt)
                    .underline()
                Text("서비스 정책")
                    .growFont(.labelM)
                    .growColor(.textAlt)
                    .underline()
            }
            .padding(.vertical, 8)
            Spacer()
        }
        .padding(.top, 12)
        .padding(.horizontal, 16)
        .growTopBar("설정", background: .backgroundAlt) {
            router.popToStack()
        }
    }
}
