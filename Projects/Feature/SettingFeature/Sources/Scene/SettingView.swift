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
    @State private var showRemoveMemberDialog = false
    
    public init(
        viewModel: SettingViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
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
                            description: profile.githubId ?? ""
                        ) {
                            router.navigate(to: SettingDestination.githubSetting)
                        }
                        let baekjoon = profile.socialAccounts.first(where: { $0.socialType == .SOLVED_AC })
                        GrowSettingCell(
                            label: "백준 설정",
                            leftIcon: .baekjoon,
                            description: profile.baekjoonId ?? ""
                        ) {
                            router.navigate(to: SettingDestination.baekjoonSetting)
                        }
                    }
                }
                GrowDivider()
                VStack(spacing: 12) {
//                    GrowSettingCell(
//                        label: "알림 허용",
//                        leftIcon: .notification,
//                        content: {
//                            GrowToggle(isOn: .constant(true))
//                        }
//                    )
                    GrowSettingCell(
                        label: "다크모드",
                        leftIcon: .moon,
                        content: {
                            GrowToggle(
                                isOn: .init {
                                    colorProvider.isDarkTheme
                                } set: { bool in
                                    colorProvider.isDarkTheme = bool
                                }
                            )
                        }
                    )
                }
                GrowDivider()
                VStack(spacing: 12) {
                    GrowSettingCell(
                        label: "로그아웃",
                        action: {
                            appState.accessToken = ""
                            appState.refreshToken = ""
                        }
                    )
                    GrowSettingCell(
                        label: "회원탈퇴",
                        labelColor: .textWarning,
                        action: {
                            showRemoveMemberDialog = true
                        }
                    )
                }
                VStack(spacing: 16) {
                    Text("버전 - \(version ?? "")")
                        .growFont(.labelM)
                        .growColor(.textAlt)
                    Link(destination: URL(string: "https://ssseqew.notion.site/f7614db9bb7e489ab209f891e28633cc?pvs=4")!) {
                        Text("개인정보 이용 약관")
                            .growFont(.labelM)
                            .growColor(.textAlt)
                            .underline()
                    }
                    Link(destination: URL(string:  "https://ssseqew.notion.site/10ad68a929c44d45bae4ea40535876a2?pvs=4")!) {
                        Text("서비스 정책")
                            .growFont(.labelM)
                            .growColor(.textAlt)
                            .underline()
                    }
                }
                .padding(.vertical, 8)
                Spacer()
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
        }
        .growTopBar("설정", background: .backgroundAlt) {
            router.popToStack()
        }
        .alert("정말 회원을 탈퇴하시겠습니까?", isPresented: $showRemoveMemberDialog) {
            Button("아니요", role: .cancel) {}
            Button("탈퇴", role: .destructive) {
                Task {
                    await viewModel.removeMember {
                        appState.accessToken = ""
                        appState.refreshToken = ""
                    }
                }
            }
        }
        .eraseToAnyView()
        .alert("회원 탈퇴를 실패 했습니다", isPresented: $viewModel.showRemoveMemberFailureDialog) {
            Button("닫기", role: .cancel) {}
        }
    }
}
