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
        ScrollView {
            VStack(spacing: 24) {
                info
                VStack(spacing: 12) {
                    stats
                    githubChart
                    baekjoonChart
                }
                Spacer().frame(height: 92)
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
        .growTopBar("프로필", background: .backgroundAlt)
        .refreshable {
            Task {
                await appState.fetchProfile()
            }
        }
    }
    
    @ViewBuilder
    private var info: some View {
        ZStack {
            VStack(spacing: 8) {
                switch appState.profile {
                case .fetching:
                    GrowAvatarShimmer(type: .extraLarge)
                    RowShimmer(width: 40)
                    RowShimmer(width: 100)
                case .success(let data):
                    GrowAvatar(type: .extraLarge)
                    Text(data.name)
                        .growFont(.bodyB)
                        .growColor(.textNormal)
                    Text("\"응아잇 안드로이드\"")
                        .growFont(.labelM)
                        .growColor(.textAlt)
                case .failure:
                    EmptyView()
                }
            }
            Button {
                router.navigate(to: ProfileDestination.setting)
            } label: {
                Image(icon: .setting)
                    .resizable()
                    .growIconColor(.textAlt)
                    .frame(size: 32)
            }
            .applyAnimation()
            .toTop()
            .toTrailing()
        }
    }
    
    @ViewBuilder
    private var stats: some View {
        if case .success(let profile) = appState.profile {
            HStack(spacing: 12) {
                switch appState.github {
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
                switch appState.baekjoon {
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
        switch appState.githubChartInfo {
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
        switch appState.baekjoonChartInfo {
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
