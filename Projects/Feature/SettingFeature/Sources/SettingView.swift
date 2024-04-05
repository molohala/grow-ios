import SwiftUI

import BaseFeature

import DesignSystem

public struct SettingView: View {
    
    @ObservedObject private var viewModel = SettingViewModel()
    
    private var navigateToProfileEditGithub: () -> Void
    private var navigateToProfileEditBaekjoon: () -> Void
    private var navigateToProfileEditJob: () -> Void
    
    public init(
        navigateToProfileEditGithub: @escaping () -> Void,
        navigateToProfileEditBaekjoon: @escaping () -> Void,
        navigateToProfileEditJob: @escaping () -> Void
    ) {
        self.navigateToProfileEditGithub = navigateToProfileEditGithub
        self.navigateToProfileEditBaekjoon = navigateToProfileEditBaekjoon
        self.navigateToProfileEditJob = navigateToProfileEditJob
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                SettingCell(
                    icon: DesignSystemAsset.github.swiftUIImage,
                    iconColor: .github,
                    text: "Github 설정",
                    description: "bestswlkh0310") {
                        navigateToProfileEditGithub()
                    }
                SettingCell(
                    icon: DesignSystemAsset.baekjoon.swiftUIImage,
                    iconColor: .baekjoon,
                    text: "백준 설정",
                    description: "hhhello0507") {
                        navigateToProfileEditBaekjoon()
                    }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
        }
        .navigationTitle("설정")
    }
}
