import SwiftUI
import BaseFeature
import DesignSystem

public struct ProfileDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ProfileDetailViewModel
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    
    public init(
        viewModel: ProfileDetailViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        let name = if case .success(let profile) = viewModel.profile {
            profile.name
        } else {
            ""
        }
        ScrollView {
            VStack(spacing: 24) {
                info
                VStack(spacing: 12) {
                    stats
                    githubChart
                    baekjoonChart
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
        }
        .growTopBar("\(name)님의 프로필", background: .backgroundAlt) {
            router.popToStack()
        }
        .task {
            await viewModel.fetchProfile()
        }
    }
    
    @ViewBuilder
    private var info: some View {
        VStack(spacing: 20) {
            switch viewModel.profile {
            case .fetching:
                VStack(spacing: 12) {
                    GrowAvatarShimmer(type: .extraLarge)
                    VStack(spacing: 0) {
                        RowShimmer(width: 60)
                        RowShimmer(width: 40)
                    }
                }
                RowShimmer(width: 100)
            case .success(let data):
                VStack(spacing: 12) {
                    GrowAvatar(type: .extraLarge)
                    VStack(spacing: 0) {
                        Text("\(data.job) 개발자")
                            .growFont(.labelR)
                            .growColor(.textDarken)
                        Text(data.name)
                            .growFont(.bodyB)
                            .growColor(.textNormal)
                    }
                }
                if !data.bio.isEmpty {
                    Text("\"\(data.bio)\"")
                        .growFont(.labelM)
                        .growColor(.textAlt)
                }
            case .failure:
                EmptyView()
            }
        }
    }
    
    @ViewBuilder
    private var stats: some View {
        if case .success(let profile) = viewModel.profile {
            HStack(spacing: 12) {
                switch viewModel.github {
                case .fetching:
                    GrowStatCellShimmer()
                case .success(let data):
                    GrowStatCell(
                        label: "커밋 개수",
                        type: .github(commit: data?.totalCommits),
                        socialId: profile.githubId
                    ) {
                        // action
                    }
                case .failure:
                    Text("불러오기 실패")
                }
                switch viewModel.baekjoon {
                case .fetching:
                    GrowStatCellShimmer()
                case .success(let data):
                    GrowStatCell(
                        label: "푼 문제 개수",
                        type: .baekjoon(solved: data?.totalSolves),
                        socialId: profile.baekjoonId
                    ) {
                        // action
                    }
                case .failure:
                    Text("불러오기 실패")
                }
            }
        }
    }
    
    @ViewBuilder
    private var githubChart: some View {
        switch viewModel.githubChartInfo {
        case .fetching:
            EmptyView()
        case .success(let chartInfo):
            if let chartInfo {
                GrowChartCell(chartInfo: chartInfo)
            }
        case .failure:
            Text("불러오기 실패")
        }
    }
    
    @ViewBuilder
    private var baekjoonChart: some View {
        switch viewModel.baekjoonChartInfo {
        case .fetching:
            EmptyView()
        case .success(let chartInfo):
            if let chartInfo {
                GrowChartCell(chartInfo: chartInfo)
            }
        case .failure:
            Text("불러오기 실패")
        }
    }
}
