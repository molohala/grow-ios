import SwiftUI
import DesignSystem
import BaseFeature
import ProfileFeatureInterface
import Flow
import MyDesignSystem

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
        .myTopBar("프로필", background: .backgroundAlt)
        .refreshable {
            Task {
                await appState.fetchProfile()
            }
        }
    }
    
    @ViewBuilder
    private var info: some View {
        HStack(spacing: 8) {
            switch appState.profile {
            case .fetching:
                MyAvatarShimmer(type: .extraLarge)
                VStack(alignment: .leading, spacing: 2) {
                    RowShimmer(width: 60)
                    RowShimmer(width: 40)
                }
            case .success(let data):
                MyAvatar(type: .extraLarge)
                VStack(alignment: .leading, spacing: 2) {
                    let isDesigner = data.job == "Designer"
                    Text("\(data.job) \(isDesigner ? "" : "개발자")")
                        .myFont(.labelR)
                        .myColor(.textDarken)
                    Text(data.name)
                        .myFont(.bodyB)
                        .myColor(.textNormal)
                }
            case .failure:
                EmptyView()
            }
            Spacer()
            Button {
                router.navigate(to: ProfileDestination.setting)
            } label: {
                Image(icon: .setting)
                    .resizable()
                    .myIconColor(.textAlt)
                    .frame(size: 32)
            }
            .applyAnimation()
        }
    }
    
    @ViewBuilder
    private var bio: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 4) {
                GrowHeadline("소개글")
                    .padding(.leading, 4)
                Button {
                    router.navigate(to: ProfileDestination.profileEdit)
                } label: {
                    Image(icon: .write)
                        .resizable()
                        .myIconColor(.textAlt)
                        .frame(size: 20)
                }
                .applyAnimation()
                Spacer()
            }
            if case .success(let profile) = appState.profile {
                if profile.bio.isEmpty {
                    Text("🔥")
                } else {
                    Text(LocalizedStringKey(profile.bio))
                        .applyOpenURL()
                        .myFont(.bodyM)
                        .myColor(.textDarken)
                }
            }
        }
        .toLeading()
    }
    
    @ViewBuilder
    private var language: some View {
        VStack(alignment: .leading, spacing: 12) {
            GrowHeadline("사용 언어")
                .padding(.leading, 4)
            HFlow(itemSpacing: 8, rowSpacing: 8) {
                switch appState.myLanguages {
                case .fetching:
                    ForEach(0..<4, id: \.self) { _ in
                        MyLanguageShimmer()
                    }
                case .success(let data):
                    if data.isEmpty {
                        Text("🔥")
                    } else {
                        ForEach(data, id: \.id) {
                            MyLanguage(text: $0.name)
                        }
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
                .toLeading()
                .padding(.leading, 4)
            stats
            githubChart
            baekjoonChart
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
                    EmptyView()
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
                    EmptyView()
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
            EmptyView()
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
            EmptyView()
        }
    }
}
