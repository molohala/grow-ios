import SwiftUI
import BaseFeature
import DesignSystem

public struct ProfileDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ProfileDetailViewModel
    
    public init(
        viewModel: ProfileDetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                profile
                stats
                if let chartInfo = viewModel.chartInfo {
                    InfinityChartCell(
                        chartInfo: chartInfo,
                        selectedType: $viewModel.selectedChart
                    )
                } else {
                    Rectangle()
                        .foregroundStyle(Color.gray300)
                        .frame(height: 100)
                        .shimmer()
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .background(Color.backgroundColor)
        .infinityTopBar(
            "\(viewModel.profile?.name ?? "..")님의 프로필",
            background: .backgroundColor
        )
        .task {
            await viewModel.fetchProfile()
            async let fetchSolvedac: () = viewModel.fetchSolvedac()
            async let fetchGithub: () = viewModel.fetchGithub()
            _ = await [fetchSolvedac, fetchGithub]
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack {
            Text("\"뚝딱뚝딱.\"")
                .padding(.vertical, 16)
                .font(.callout)
                .foregroundStyle(.gray)
        }
        .applyCardView()
    }
    
    
    @ViewBuilder
    private var stats: some View {
        HStack(spacing: 16) {
            if let github = viewModel.github, viewModel.githubFlow == .success {
                let todayCommit = github.todayCommits.contributionCount
                InfinityStatCell("커밋 개수", type: .github(todayCommit)) {
                    // nav
                }
            } else if viewModel.githubFlow == .fetching {
                InfinityStatShimmerCell()
            } else {
                InfinityStatCell("커밋 개수", type: .github()) {}
            }
            
            if let solvedac = viewModel.solvedac, viewModel.solvedacFlow == .success {
                let todaySolves = solvedac.todaySolves.solvedCount
                InfinityStatCell("푼 문제 개수", type: .baekjoon(todaySolves)) {
                    // nav
                }
            } else if viewModel.solvedacFlow == .fetching {
                InfinityStatShimmerCell()
            } else {
                InfinityStatCell("푼 문제 개수", type: .baekjoon()) {}
            }
        }
    }
}
