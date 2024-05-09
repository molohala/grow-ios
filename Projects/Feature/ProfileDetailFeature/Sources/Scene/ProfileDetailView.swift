import SwiftUI
import BaseFeature
import DesignSystem
import Flow

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
            VStack(spacing: 28) {
                info
                bio
                language
                statics
                Spacer().frame(height: 92)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
        }
        .scrollIndicators(.hidden)
        .growTopBar("\(name)님의 프로필", background: .backgroundAlt) {
            router.popToStack()
        }
        .refreshable {
            Task {
                await viewModel.fetchProfile()
            }
        }
        .task {
            await viewModel.fetchProfile()
        }
    }
    
    @ViewBuilder
    private var info: some View {
        HStack(spacing: 8) {
            switch viewModel.profile {
            case .fetching:
                GrowAvatarShimmer(type: .extraLarge)
                VStack(alignment: .leading, spacing: 2) {
                    RowShimmer(width: 60)
                    RowShimmer(width: 40)
                }
            case .success(let data):
                GrowAvatar(type: .extraLarge)
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(data.job) 개발자")
                        .growFont(.labelR)
                        .growColor(.textDarken)
                    Text(data.name)
                        .growFont(.bodyB)
                        .growColor(.textNormal)
                }
            case .failure:
                EmptyView()
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var bio: some View {
        VStack(alignment: .leading, spacing: 12) {
            GrowHeadline("소개글")
            if case .success(let profile) = viewModel.profile {
                Text(LocalizedStringKey(profile.bio))
                    .applyOpenURL()
                    .growFont(.bodyM)
                    .growColor(.textDarken)
            }
        }
        .toLeading()
    }
    
    @ViewBuilder
    private var language: some View {
        VStack(alignment: .leading, spacing: 12) {
            GrowHeadline("사용 언어")
            HFlow(itemSpacing: 8, rowSpacing: 8) {
                switch viewModel.languages {
                case .fetching:
                    ForEach(0..<4, id: \.self) { _ in
                        GrowLanguageShimmer()
                    }
                case .success(let data):
                    ForEach(data, id: \.id) {
                        GrowLanguage(text: $0.name)
                    }
                case .failure:
                    EmptyView()
                }
            }
        }
        .toLeading()
    }
    
    @ViewBuilder
    private var statics: some View {
        VStack(alignment: .leading, spacing: 12) {
            GrowHeadline("통계")
            stats
            githubChart
            baekjoonChart
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
