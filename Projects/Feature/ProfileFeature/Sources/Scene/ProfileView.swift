import SwiftUI
import DesignSystem
import BaseFeature
import ProfileFeatureInterface

public struct ProfileView: View {
    
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel: ProfileViewModel
    
    public init(
        viewModel: ProfileViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                profile
                stats
                if let chartInfo = viewModel.chartInfo {
                    InfinityChartCell(
                        chartInfo: chartInfo,
                        selectedType: $viewModel.selectedChart
                    )
                } else {
                    InfinityChartCellShimmer()
                        .shimmer()
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            .padding(.bottom, 108)
        }
        .background(Color.backgroundColor)
        .onChange(of: viewModel.selectedChart) { type in
            handleSelectingChart(type: type)
        }
        .onChange(of: appState.profile) {
            guard $0 != nil else { return }
            handleSelectingChart(type: viewModel.selectedChart)
        }
        .onAppear {
            handleSelectingChart(type: viewModel.selectedChart)
        }
        .refreshable {
            appState.fetchProfile()
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack {
            HStack(spacing: 0) {
                Rectangle()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .foregroundStyle(.gray)
                if case .success(let profile) = appState.profile {
                    Text(profile.name)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding(.leading, 8)
                }
                
                Spacer()
                Button {
                    router.navigate(to: ProfileDestination.setting)
                } label: {
                    Text("설정")
                        .font(.callout)
                        .foregroundStyle(.gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color.backgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .applyAnimation()
            }
//            Text("\"뚝딱뚝딱.\"")
//                .padding(.vertical, 16)
//                .font(.callout)
//                .foregroundStyle(.gray)
        }
        .applyCardView()
    }
    
    @ViewBuilder
    private var stats: some View {
        if case .success(let github) = appState.github,
           case .success(let solvedac) = appState.solvedac {
            HStack(spacing: 16) {
                InfinityStatCell("커밋 개수", type: .github(github.totalCommits)) {
                    // nav
                }
                InfinityStatCell("푼 문제 개수", type: .baekjoon(solvedac.totalSolves)) {
                    // nav
                }
            }
        }
    }
    
    func handleSelectingChart(type: ChartType) {
        if case .success(let github) = appState.github,
           case .success(let solvedac) = appState.solvedac {
            switch type {
            case .github:
                viewModel.chartInfo = github.weekCommits.githubWeekChartInfo
            case .baekjoon:
                viewModel.chartInfo = solvedac.weekSolves.baekjoonWeekChartInfo
            }
        }
    }
}
