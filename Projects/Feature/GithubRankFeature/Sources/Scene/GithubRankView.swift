import SwiftUI
import DesignSystem
import BaseFeature
import GithubRankFeatureInterface

public struct GithubRankView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var colorProvider: ColorProvider
    @StateObject private var viewModel: GithubRankViewModel
    
    public init(
        viewModel: GithubRankViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if case .success(let data) = appState.github,
               data == nil {
                recommendingSettingGithub
            } else {
                indicator
                switch viewModel.githubRanks {
                case .fetching:
                    VStack(spacing: 12) {
                        ForEach(0..<3, id: \.self) { _ in
                            GrowRankCellShimmer()
                        }
                    }
                    .padding(12)
                case .success(let data):
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(data, id: \.memberId) { rank in
                                GrowRankCell(
                                    name: rank.memberName,
                                    socialId: rank.socialId,
                                    rank: rank.rank,
                                    label: "\(rank.count) 커밋",
                                    action: {
                                        router.navigate(to: GithubRankDestination.profileDetail(memberId: rank.memberId))
                                    }
                                )
                            }
                            Spacer().frame(height: 92)
                        }
                        .padding(12)
                    }
                case .failure:
                    EmptyView()
                }
            }
        }
        .growTopBar("Github 랭킹")
        .task {
            Task {
                await viewModel.fetchGithubRank()
            }
        }
        .task(id: viewModel.selectedTab) {
            await viewModel.fetchGithubRank()
        }
    }
    
    @ViewBuilder
    private var recommendingSettingGithub: some View {
        VStack(spacing: 16) {
            Text("아직 Github ID를 설정하지 않았어요")
                .growFont(.bodyM)
                .growColor(.textNormal)
            GrowButton("설정하기", type: .Small) {
                router.navigate(to: GithubRankDestination.githubSetting)
            }
        }
        .toCenter()
    }
    
    @ViewBuilder
    private var indicator: some View {
        HStack(spacing: 12) {
            ForEach(GithubTab.allCases, id: \.self) { tab in
                GrowTabButton(
                    tab.rawValue,
                    isSelected: tab == viewModel.selectedTab
                ) {
                    viewModel.selectedTab = tab
                }
            }
            Spacer()
        }
        .padding(.leading, 12)
    }
}
