import SwiftUI
import HomeFeatureInterface
import DesignSystem
import BaseFeature
import CommunityFeatureInterface

public struct HomeView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    
    @StateObject private var viewModel: HomeViewModel
    @State private var showRemoveDialog = false
    
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
        .task {
            async let fetchTodayGithubRank: () = viewModel.fetchTodayGithubRank()
            async let fetchTodayBaekjoonRank: () = viewModel.fetchTodayBaekjoonRank()
            async let fetchBestCommunities: () = viewModel.fetchBestCommunities()
            _ = await [fetchTodayGithubRank, fetchTodayBaekjoonRank, fetchBestCommunities]
        }
        .alert("정말 게시글을 삭제 하시겠습니까?", isPresented: $showRemoveDialog) {
            Button("아니요", role: .cancel) {}
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeCommunity()
                }
            }
        }
    }
    
    @ViewBuilder
    private var profile: some View {
        VStack(spacing: 16) {
            switch appState.profile {
            case .success(let data):
                SubTitle("iOS 개발자\n\(data.name)님 환영합니다")
                    .lineSpacing(4.0)
                    .font(.title)
            case .fetching:
                VStack {
                    SubTitle("--------")
                        .lineSpacing(4.0)
                        .font(.title)
                    SubTitle("------------")
                        .lineSpacing(4.0)
                        .font(.title)
                }
                .shimmer()
            case .failure:
                Text("불러오기 실패")
            }
            HStack(spacing: 16) {
                if case .success(let data) = appState.github {
                    let todayCommit = data.todayCommits.contributionCount
                    InfinityStatCell("오늘 한 커밋 개수", type: .github(todayCommit)) {
                        // nav
                    }
                } else if appState.github == .fetching {
                    InfinityStatShimmerCell()
                } else {
                    InfinityStatCell("오늘 한 커밋 개수", type: .github()) {}
                }
                
                if case .success(let data) = appState.solvedac {
                     let todaySolves = data.todaySolves.solvedCount
                     InfinityStatCell("오늘 푼 문제 개수", type: .baekjoon(todaySolves)) {
                         // nav
                     }
                } else if appState.solvedac == .fetching {
                    InfinityStatShimmerCell()
                } else {
                    InfinityStatCell("오늘 푼 문제 개수", type: .baekjoon()) {}
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
//            let profileId = appState.profile?.id ?? 0
            switch (viewModel.todayGithubRanks, appState.profile) {
            case (.fetching, _), (_, .fetching):
                VStack(spacing: 12) {
                    ForEach(0..<3, id: \.self) { _ in
                        InfinityGithubRankCellShimmer()
                            .shimmer()
                    }
                }
                .padding(.vertical, 4)
                .applyCardView()
            case (.success(let data), .success(let profile)):
                if data.isEmpty {
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
                        ForEach(data, id: \.self) { githubRank in
                            InfinityGithubRankCell(rank: githubRank, isMe: githubRank.memberId == profile.id) {
                                router.navigate(to: HomeDestination.profileDetail(memberId: githubRank.memberId))
                            }
                        }
                    }
                    .padding(.vertical, 4)
                    .applyCardView()
                }
            default:
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
            switch (viewModel.todayBaekjoonRanks, appState.profile) {
            case (.fetching, _), (_, .fetching):
                VStack(spacing: 12) {
                    ForEach(0..<3, id: \.self) { _ in
                        InfinityBaekjoonRankCellShimmer()
                            .shimmer()
                    }
                }
                .padding(.vertical, 4)
                .applyCardView()
            case (.success(let data), .success(let profile)):
                if data.isEmpty {
                    HStack {
                        Spacer()
                        VStack(spacing: 8) {
                            Text("첫 번째로 문제를 풀어보세요!")
                                .font(.subheadline)
                            Text("아직 아무도 문제를 풀지 않았어요ㅠㅠ")
                                .foregroundStyle(Color.gray500)
                                .font(.footnote)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .applyCardView()
                } else {
                    VStack(spacing: 12) {
                        ForEach(data, id: \.self) { rank in
                            InfinityBaekjoonRankCell(rank: rank, isMe: rank.memberId == profile.id) {
                                router.navigate(to: HomeDestination.profileDetail(memberId: rank.memberId))
                            }
                        }
                    }
                    .padding(.vertical, 4)
                    .applyCardView()
                }
            default:
                Text("불러오기 실패..")
            }
        }
    }
    
    @ViewBuilder
    private var weekNiceCommunity: some View {
        VStack(spacing: 12) {
            SubTitle("이번주 인기글")
            switch viewModel.weekCommunities {
            case .fetching:
                VStack(spacing: 12) {
                    ForEach(0..<3, id: \.self) { _ in
                        CommunityCellShimmer()
                            .shimmer()
                    }
                }
                .padding(.vertical, 4)
            case .success(let data):
                if data.isEmpty {
                    HStack {
                        Spacer()
                        VStack(spacing: 8) {
                            Text("😱")
                                .font(.subheadline)
                            Text("아직 아무도 게시글을 올리지 않았어요")
                                .foregroundStyle(Color.gray500)
                                .font(.footnote)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .applyCardView()
                } else {
                    VStack(spacing: 12) {
                        ForEach(data, id: \.community.communityId) { community in
                            let communityId = community.community.communityId
                            CommunityCell(
                                community: community,
                                likeAction: {
                                    await viewModel.patchLike(communityId: communityId)
                                },
                                editAction: {
                                    router.navigate(to: HomeDestination.communityEdit(communityContent: community.community))
                                },
                                removeAction: {
                                    showRemoveDialog = true
                                }
                            ) {
                                router.navigate(to: HomeDestination.communityDetail)
                            }
                        }
                    }
                }
            case .failure:
                Text("불러오기 실패...")
            }
            
        }
    }
}
