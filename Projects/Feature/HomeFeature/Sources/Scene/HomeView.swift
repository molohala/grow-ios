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
        ScrollView {
            VStack(spacing: 0) {
                greeting
                stat
                todayGithub
                todayBaekjoon
                weekBestForum
                Spacer().frame(height: 92)
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
        .growTopBar("홈", background: .backgroundAlt, backButtonAction: nil)
        .task {
            async let fetchTodayGithubRank: () = viewModel.fetchTodayGithubRank()
            async let fetchTodayBaekjoonRank: () = viewModel.fetchTodayBaekjoonRank()
            async let fetchBestCommunities: () = viewModel.fetchBestCommunities()
            _ = await [fetchTodayGithubRank, fetchTodayBaekjoonRank, fetchBestCommunities]
        }
        .alert("게시글 삭제에 실패했습니다", isPresented: .init(
            get: { viewModel.removedCommunityFlow == .failure },
            set: { _ in viewModel.removedCommunityFlow = .fetching }
        )) {
            Button("확인", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("게시글 삭제 성공", isPresented: .init {
            viewModel.removedCommunityFlow == .success(true)
        } set: { _ in
            viewModel.removedCommunityFlow = .fetching
        }) {
            Button("닫기", role: .cancel) {}
        }
        .eraseToAnyView()
        .alert("정말 게시글을 삭제 하시겠습니까?", isPresented: $showRemoveDialog) {
            Button("아니요", role: .cancel) {}
            Button("삭제", role: .destructive) {
                Task {
                    await viewModel.removeCommunity()
                    await viewModel.fetchBestCommunities()
                }
            }
        }
    }
    
    @ViewBuilder
    private var greeting: some View {
        VStack(spacing: 12) {
            switch appState.profile {
            case .fetching:
                VStack(alignment: .leading, spacing: 4) {
                    RowShimmer(width: 80)
                    RowShimmer(width: 120)
                }
            case .success(let data):
                VStack(alignment: .leading, spacing: 0) {
                    let isDeveloper = data.job.isEmpty
                    GrowHeadline("\(data.job)\(isDeveloper ? "" : " ")개발자")
                    GrowHeadline("\(data.name)님 환영합니다")
                }
            case .failure:
                EmptyView()
            }
        }
        .toLeading()
    }
    
    @ViewBuilder
    private var stat: some View {
        if case .success(let profile) = appState.profile {
            HStack(spacing: 16) {
                switch appState.github {
                case .fetching:
                    GrowStatCellShimmer()
                case .success(let data):
                    GrowStatCell(
                        label: "오늘 한 커밋 개수",
                        type: .github(commit: data?.todayCommits.contributionCount),
                        socialId: profile.githubId
                    ) {}
                case .failure:
                    EmptyView()
                }
                switch appState.baekjoon {
                case .fetching:
                    GrowStatCellShimmer()
                case .success(let data):
                    GrowStatCell(
                        label: "오늘 푼 문제 개수",
                        type: .baekjoon(solved: data?.todaySolves.solvedCount),
                        socialId: profile.baekjoonId
                    ) {}
                case .failure:
                    EmptyView()
                }
            }
            .padding(.vertical, 20)
        }
    }
    
    @ViewBuilder
    private var todayGithub: some View {
        VStack(spacing: 0) {
            GrowHeadline("오늘의 Github Top 3")
                .toLeading()
            VStack(spacing: 4) {
                switch viewModel.todayGithubRanks {
                case .fetching:
                    ForEach(0..<3, id: \.self) { _ in
                        GrowRankCellShimmer()
                    }
                case .success(let data):
                    ForEach(data, id: \.memberId) { rank in
                        GrowRankCell(
                            name: rank.memberName,
                            socialId: rank.socialId,
                            rank: rank.rank,
                            label: "\(rank.count) 커밋"
                        ) {
                            router.navigate(to: HomeDestination.profileDetail(memberId: rank.memberId))
                        }
                    }
                case .failure:
                    EmptyView()
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .applyCardView()
            .padding(.vertical, 12)
        }
        .padding(.vertical, 8)
    }
    
    @ViewBuilder
    private var todayBaekjoon: some View {
        VStack(spacing: 0) {
            GrowHeadline("오늘의 백준 Top 3")
                .toLeading()
            VStack(spacing: 4) {
                switch viewModel.todayBaekjoonRanks {
                case .fetching:
                    ForEach(0..<3, id: \.self) { _ in
                        GrowRankCellShimmer()
                    }
                case .success(let data):
                    ForEach(data, id: \.memberId) { rank in
                        GrowRankCell(
                            name: rank.memberName,
                            socialId: rank.socialId,
                            rank: rank.rank,
                            label: "\(rank.count) 문제"
                        ) {
                            router.navigate(to: HomeDestination.profileDetail(memberId: rank.memberId))
                        }
                    }
                case .failure:
                    EmptyView()
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .applyCardView()
            .padding(.vertical, 12)
        }
        .padding(.vertical, 8)
    }
    
    @ViewBuilder
    private var weekBestForum: some View {
        VStack(spacing: 0) {
            GrowHeadline("이번주 인기글")
                .toLeading()
            VStack(spacing: 8) {
                switch viewModel.weekCommunities {
                case .fetching:
                    ForEach(0..<3, id: \.self) { _ in
                        GrowForumCellShimmer()
                    }
                case .success(let data):
                    if case .success(let profile) = appState.profile {
                        ForEach(data, id: \.community.communityId) { forum in
                            let forumId = forum.community.communityId
                            GrowForumCell(
                                forum: forum,
                                profileId: profile.id,
                                likeAction: {
                                    await viewModel.patchLike(communityId: forum.community.communityId)
                                },
                                removeAction: {
                                    viewModel.selectedRemoveCommunity = forum
                                    showRemoveDialog = true
                                },
                                editAction: {
                                    router.navigate(to: HomeDestination.communityEdit(forumId: forum.community.communityId))
                                },
                                action: {
                                    router.navigate(to: HomeDestination.communityDetail(forumId: forum.community.communityId))
                                }
                            )
                        }
                    }
                case .failure:
                    EmptyView()
                }
            }
            .padding(.vertical, 8)
        }
        .padding(.vertical, 8)
    }
}
