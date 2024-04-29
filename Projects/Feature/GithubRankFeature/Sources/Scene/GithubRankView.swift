import SwiftUI
import DesignSystem
import BaseFeature
import GithubRankFeatureInterface

public struct GithubRankView: View {
    
    @EnvironmentObject private var appState: AppState
    @ObservedObject private var viewModel: GithubRankViewModel
    
    @EnvironmentObject private var router: Router
    
    public init(
        viewModel: GithubRankViewModel
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    if let profile = appState.profile,
                       profile.socialAccounts.first(where: { $0.socialType == .GITHUB }) == nil {
                        githubSetting
                            .padding(.horizontal, 24)
                    }
                    selector
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                    let profileId = appState.profile?.id ?? 0
                    switch viewModel.githubRanksFlow {
                    case .fetching:
                        ForEach(0..<7, id: \.self) { _ in
                            InfinityGithubRankCellShimmer()
                                .padding(.horizontal, 16)
                                .shimmer()
                        }
                    case .success:
                        ForEach(viewModel.githubRanks, id: \.memberId) { githubRank in
                            InfinityGithubRankCell(rank: githubRank, isMe: profileId == githubRank.memberId) {
                                router.navigate(to: GithubRankDestination.profileDetail)
                            }
                            .padding(.horizontal, 16)
                        }
                    case .failure:
                        Text("불러오기 실패..")
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 128)
            }
            .refreshable {
                Task {
                    await viewModel.handleGithubRank()
                }
            }
        }
        .task {
            await viewModel.handleGithubRank()
        }
    }
    
    @ViewBuilder
    private var githubSetting: some View {
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
    }
    
    @ViewBuilder
    private var selector: some View {
        HStack(spacing: 8) {
            ForEach(GithubRankViewModel.GithubTab.allCases, id: \.self) { tab in
                InfinitySelector(text: tab.rawValue, isSelected: tab == viewModel.selectedTab) {
                    viewModel.selectedTab = tab
                }
            }
            Spacer()
        }
    }
}
