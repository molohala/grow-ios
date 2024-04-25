import SwiftUI
import HomeFeatureInterface
import DesignSystem
import BaseFeature
import CommunityFeatureInterface

public struct HomeView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    
    @ObservedObject private var viewModel: HomeViewModel
    
    public init(
        viewModel: HomeViewModel
    ) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: 40) {
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
        .task {
            await viewModel.fetchTodayGithubRank()
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
                    SubTitle("iOS 개발자")
                        .lineSpacing(4.0)
                        .font(.title)
                    SubTitle("더미님 환영합니다")
                        .lineSpacing(4.0)
                        .font(.title)
                }
                .shimmer()
            }
            
            HStack(spacing: 16) {
                if let solvedac = appState.solvedac,
                   let github = appState.github {
                    let todayCommit = github.todayCommits.contributionCount
                    let todaySolves = solvedac.todaySolves.solvedCount
                    InfinityStatCell("오늘 한 커밋 개수", type: .github(todayCommit)) {
                        // nav
                    }
                    InfinityStatCell("오늘 푼 문제 개수", type: .baekjoon(todaySolves)) {
                        // nav
                    }
                } else {
                    InfinityStatShimmerCell()
                    InfinityStatShimmerCell()
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
                    }
                }
                .padding(.vertical, 4)
                .applyCardView()
            case .success:
                VStack(spacing: 12) {
                    ForEach(viewModel.todayGithubRanks, id: \.self) { githubRank in
                        InfinityGithubRankCell(rank: githubRank, isMe: githubRank.memberId == profileId) {
                            router.navigate(to: HomeDestination.profileDetail)
                        }
                    }
                }
                .padding(.vertical, 4)
                .applyCardView()
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
                        router.navigate(to: HomeDestination.profileDetail)
                    }
                }
            }
            .padding(.vertical, 4)
            .applyCardView()
        }
    }
}
