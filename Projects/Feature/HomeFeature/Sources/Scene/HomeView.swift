import SwiftUI
import HomeFeatureInterface
import DesignSystem
import BaseFeature
import CommunityFeatureInterface
import MyDesignSystem

public struct HomeView: View {
    
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var blockManager: BlockManager
    @StateObject private var viewModel: HomeViewModel
    @State private var showRemoveDialog = false
    @State private var showReportCommunityDialog = false
    @State private var showBlockDialog = false
    @State private var selectedBlockUserId: Int?
    
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
        .myTopBar("홈", background: .backgroundAlt, backButtonAction: nil)
        .task {
            await viewModel.fetchAll()
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
        .eraseToAnyView()
        .alert("신고 내용을 작성해주세요", isPresented: $showReportCommunityDialog) {
            TextField("", text: $viewModel.reportCommunityReason)
            Button("취소", role: .cancel) {}
            Button("신고", role: .destructive) {
                Task {
                    await viewModel.reportCommunity()
                }
            }
        } message: {
            Text("검토까지는 최대 24시간이 소요됩니다")
        }
        .eraseToAnyView()
        .alert("해당 유저를 차단하시겠습니까?", isPresented: $showBlockDialog) {
            Button("차단", role: .destructive) {
                guard let selectedBlockUserId else { return }
                Task {
                    await blockManager.block(blockUserId: selectedBlockUserId)
                    await viewModel.fetchAll()
                }
            }
            Button("아니요", role: .cancel) {}
        }
        .refreshable {
            await viewModel.fetchAll()
        }
        .onChange(of: viewModel.refreshFailure) {
            if $0 {
                appState.accessToken = nil
                appState.refreshToken = nil
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
                    let isDesigner = data.job == "Designer"
                    GrowHeadline("\(data.job)\(isDeveloper ? "" : " ")\(isDesigner ? "" : "개발자")")
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
            HStack {
                GrowHeadline("오늘의 Github Top 3")
                Spacer()
                if let updatedAt = viewModel.todayGithubRanks.data?.updatedAt?.updatedAt {
                    Text(updatedAt)
                        .myFont(.labelR)
                        .myColor(MyColorScheme.textAlt)
                }
            }
            .padding(.horizontal, 4)
            VStack(spacing: 4) {
                switch viewModel.todayGithubRanks {
                case .fetching:
                    ForEach(0..<3, id: \.self) { _ in
                        GrowRankCellShimmer()
                    }
                case .success(let data):
                    ForEach(data.ranks, id: \.memberId) { rank in
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
            HStack {
                GrowHeadline("오늘의 백준 Top 3")
                Spacer()
                if let updatedAt = viewModel.todayBaekjoonRanks.data?.updatedAt?.updatedAt {
                    Text(updatedAt)
                        .myFont(.labelR)
                        .myColor(MyColorScheme.textAlt)
                }
            }
            .padding(.horizontal, 4)
            VStack(spacing: 4) {
                switch viewModel.todayBaekjoonRanks {
                case .fetching:
                    ForEach(0..<3, id: \.self) { _ in
                        GrowRankCellShimmer()
                    }
                case .success(let data):
                    ForEach(data.ranks, id: \.memberId) { rank in
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
                                profileId: profile.id
                            ) { action in
                                switch action {
                                case .like:
                                    await viewModel.patchLike(communityId: forumId)
                                case .remove:
                                    viewModel.selectedRemoveCommunity = forum
                                    showRemoveDialog = true
                                case .edit:
                                    router.navigate(to: HomeDestination.communityEdit(forumId: forumId))
                                case .report:
                                    viewModel.selectedReportCommunity = forum
                                    showReportCommunityDialog = true
                                case .block:
                                    showBlockDialog = true
                                    selectedBlockUserId = forum.community.writerId
                                case .click:
                                    router.navigate(to: HomeDestination.communityDetail(forumId: forumId))
                                case .updateImageOpenGraph(let openGraph):
                                    viewModel.updateImageOpenGraph(forumId: forumId, openGraph: openGraph)
                                }
                            }
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
