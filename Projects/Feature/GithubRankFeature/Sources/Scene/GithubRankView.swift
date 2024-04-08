import SwiftUI
import DesignSystem
import BaseFeature
import ProfileDetailFeatureInterface
import GithubRankFeatureInterface
import GithubSettingFeatureInterface

public struct GithubRankView: View {
    
    @ObservedObject private var viewModel = GithubRankViewModel()
    
    @EnvironmentObject private var router: Router
    
    private let profileDetailBuildable: any ProfileDetailBuildable
    private let githubSettingBuildable: any GithubSettingBuildable
    
    public init(
        profileDetailBuildable: any ProfileDetailBuildable,
        githubSettingBuildable: any GithubSettingBuildable
    ) {
        self.profileDetailBuildable = profileDetailBuildable
        self.githubSettingBuildable = githubSettingBuildable
    }
    
    public var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    VStack {
                        Text("아직 Github 설정이 완료되지 않았네요")
                            .foregroundStyle(.gray)
                            .font(.caption)
                        Text("Github 설정을 하고 순위권에 도전해 보세요!")
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                        InfinityButton("설정하기", height: 40) {
                            router.navigate(to: GithubRankDestination.githubSetting)
                        }
                        .frame(width: 150)
                        .font(.callout)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 24)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.gray.opacity(0.3))
                    }
                    .padding(.horizontal, 24)
                    HStack {
                        InfinitySelector(text: "이번 주", isSelected: true) {
                            //
                        }
                        InfinitySelector(text: "전체", isSelected: false) {
                            //
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    ForEach(viewModel.rank, id: \.self) { i in
                        InfinityGithubRankCell(rank: i + 1) {
                            router.navigate(to: GithubRankDestination.profileDetail)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 128)
            }
        }
        .navigationDestination(for: GithubRankDestination.self) {
            switch $0 {
            case .profileDetail: profileDetailBuildable.makeView().eraseToAnyView()
            case .githubSetting: githubSettingBuildable.makeView().eraseToAnyView()
            }
        }
    }
}
