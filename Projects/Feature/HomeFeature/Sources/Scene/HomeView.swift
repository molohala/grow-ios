import SwiftUI
import HomeFeatureInterface
import DesignSystem
import BaseFeature
import CommunityFeatureInterface

public struct HomeView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    
    @StateObject private var viewModel: HomeViewModel
    
    public init(
        viewModel: HomeViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 40) {
                profile
                    .padding(.top, 24)
                todayGithub
                todayBaekjoon
                weekNiceCommunity
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 108)
        }
        .background(Color.backgroundColor)
        .onAppear {
            viewModel.fetchTodayGithubRank()
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack(spacing: 16) {
            if let profile = appState.profile {
                SubTitle("iOS 개발자\n\(profile.name)님 환영합니다")
                    .lineSpacing(4.0)
                    .font(.title)
            } else {
                VStack {
                    SubTitle("--------")
                        .lineSpacing(4.0)
                        .font(.title)
                    SubTitle("------------")
                        .lineSpacing(4.0)
                        .font(.title)
                }
                .shimmer()
            }
            
            HStack(spacing: 16) {
                if let github = appState.github, appState.githubFlow == .success {
                    let todayCommit = github.todayCommits.contributionCount
                    InfinityStatCell("오늘 한 커밋 개수", type: .github(todayCommit)) {
                        // nav
                    }
                } else if appState.githubFlow == .fetching {
                    InfinityStatShimmerCell()
                } else {
                    InfinityStatCell("오늘 한 커밋 개수", type: .github()) {}
                }
                
                if let solvedac = appState.solvedac, appState.solvedacFlow == .success {
                     let todaySolves = solvedac.todaySolves.solvedCount
                     InfinityStatCell("오늘 푼 문제 개수", type: .baekjoon(todaySolves)) {
                         // nav
                     }
                } else if appState.solvedacFlow == .fetching {
                    InfinityStatShimmerCell()
                } else {
                    InfinityStatCell("오늘 푼 문제 개수", type: .baekjoon()) {}
                }
            }
        }
    }
    
    @ViewBuilder
    private var weekNiceCommunity: some View {
        VStack(spacing: 12) {
            SubTitle("이번주 인기글")
            VStack(spacing: 12) {
                ForEach(viewModel.weekCommunities, id: \.community.communityId) { community in
                    CommunityCell(
                        community: community,
                        likeAction: {},
                        editAction: {},
                        removeAction: {}
                    ) {
                        router.navigate(to: HomeDestination.communityDetail)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var todayGithub: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                SubTitle("오늘의 Github Top 3")
                Spacer()
            }
            let profileId = appState.profile?.id ?? 0
            switch viewModel.todayGithubRanksFlow {
            case .fetching:
                VStack(spacing: 12) {
                    ForEach(0..<3, id: \.self) { _ in
                        InfinityGithubRankCellShimmer()
                            .shimmer()
                    }
                }
                .padding(.vertical, 4)
                .applyCardView()
            case .success:
                if viewModel.todayGithubRanks.isEmpty {
                    HStack {
                        Spacer()
                        VStack(spacing: 8) {
                            Text("첫 번째로 커밋을 해보세요!")
                                .font(.subheadline)
                            Text("아직 아무도 커밋을 안 했어요")
                                .foregroundStyle(Color.gray500)
                                .font(.footnote)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .applyCardView()
                } else {
                    VStack(spacing: 12) {
                        ForEach(viewModel.todayGithubRanks, id: \.self) { githubRank in
                            InfinityGithubRankCell(rank: githubRank, isMe: githubRank.memberId == profileId) {
                                router.navigate(to: HomeDestination.profileDetail(memberId: githubRank.memberId))
                            }
                        }
                    }
                    .padding(.vertical, 4)
                    .applyCardView()
                }
            case .failure:
                Text("불러오기 실패..")
            }
        }
    }
    
    @ViewBuilder
    private var todayBaekjoon: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                SubTitle("오늘의 백준 Top 3")
                Spacer()
            }
            let profileId = appState.profile?.id ?? 0
            VStack(spacing: 12) {
                ForEach(viewModel.todayGithubRanks, id: \.self) { githubRank in
                    InfinityGithubRankCell(rank: githubRank, isMe: profileId == githubRank.memberId) {
                        router.navigate(to: HomeDestination.profileDetail(memberId: githubRank.memberId))
                    }
                }
            }
            .padding(.vertical, 4)
            .applyCardView()
        }
    }
}
