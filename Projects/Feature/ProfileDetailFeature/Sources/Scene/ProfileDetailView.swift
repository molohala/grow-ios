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
//                stats
//                if let chartInfo = viewModel.chartInfo {
//                    GrowChartCell(
//                        chartInfo: chartInfo,
//                        selectedType: $viewModel.selectedChart
//                    )
//                } else {
//                    GrowChartCellShimmer()
//                        .shimmer()
//                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
//        .background(Color.backgroundColor)
//        .growTopBar(
//            "\(viewModel.profile?.name ?? "..")님의 프로필",
//            background: .backgroundColor
//        )
//        .task {
//            await viewModel.fetchProfile()
//        }
//        .onChange(of: viewModel.selectedChart) { type in
//            handleSelectingChart(type: type)
//        }
//        .onChange(of: viewModel.github) { _ in
//            handleSelectingChart(type: viewModel.selectedChart)
//        }
//        .onChange(of: viewModel.solvedac) { _ in
//            handleSelectingChart(type: viewModel.selectedChart)
//        }
//        .refreshable {
//            Task {
//                await viewModel.fetchProfile()
//            }
        }
    }
    
//    @ViewBuilder
//    private var stats: some View {
//        HStack(spacing: 16) {
//            if let github = viewModel.github, viewModel.githubFlow == .success {
//                let todayCommit = github.todayCommits.contributionCount
//                GrowStatCell("커밋 개수", type: .github(todayCommit)) {
//                    // nav
//                }
//            } else if viewModel.githubFlow == .fetching {
//                GrowStatShimmerCell()
//            } else {
//                GrowStatCell("커밋 개수", type: .github()) {}
//            }
//            
//            if let solvedac = viewModel.solvedac, viewModel.solvedacFlow == .success {
//                let todaySolves = solvedac.todaySolves.solvedCount
//                GrowStatCell("푼 문제 개수", type: .baekjoon(todaySolves)) {
//                    // nav
//                }
//            } else if viewModel.solvedacFlow == .fetching {
//                GrowStatShimmerCell()
//            } else {
//                GrowStatCell("푼 문제 개수", type: .baekjoon()) {}
//            }
//        }
//    }
//    
//    func handleSelectingChart(type: ChartType) {
//        if let github = viewModel.github,
//           let solvedac = viewModel.solvedac {
//            switch type {
//            case .github:
//                viewModel.chartInfo = github.weekCommits.githubWeekChartInfo
//            case .baekjoon:
//                viewModel.chartInfo = solvedac.weekSolves.baekjoonWeekChartInfo
//            }
//        }
//    }

