import Foundation
import CommunityServiceInterface
import RankServiceInterface
import LikeServiceInterface
import BaseFeature

public final class HomeViewModel: ObservableObject {
    
    // MARK: - UseCases
    private let getTodayGithubRankUseCase: any GetTodayGithubRankUseCase
    private let getTodaySolvedacRankUseCase: any GetTodaySolvedacRankUseCase
    private let getBestCommunitiesUseCase: any GetBestCommuntiesUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    private let removeCommunityUseCase: any RemoveCommunityUseCase
    private let reportCommunityUseCase: any ReportCommunityUseCase
    
    // MARK: - Properties
    @Published var weekCommunities: FetchFlow<[Community]> = .fetching
    @Published var todayGithubRanks: FetchFlow<[Rank]> = .fetching
    @Published var todayBaekjoonRanks: FetchFlow<[Rank]> = .fetching
    @Published var removedCommunityFlow: FetchFlow<Bool> = .fetching
    @Published var selectedRemoveCommunity: Community?
    @Published var selectedReportCommunity: Community?
    @Published var reportCommunityReason = ""
    @Published var reportCommentFlow: FetchFlow<Bool> = .fetching
    
    public init(
        getTodayGithubRankUseCase: any GetTodayGithubRankUseCase,
        getTodaySolvedacRankUseCase: any GetTodaySolvedacRankUseCase,
        getBestCommunitiesUseCase: any GetBestCommuntiesUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        removeCommunityUseCase: any RemoveCommunityUseCase,
        reportCommunityUseCase: any ReportCommunityUseCase
    ) {
        self.getTodayGithubRankUseCase = getTodayGithubRankUseCase
        self.getTodaySolvedacRankUseCase = getTodaySolvedacRankUseCase
        self.getBestCommunitiesUseCase = getBestCommunitiesUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.removeCommunityUseCase = removeCommunityUseCase
        self.reportCommunityUseCase = reportCommunityUseCase
    }
    
    @MainActor
    func fetchTodayGithubRank() async {
        do {
            todayGithubRanks = .fetching
            let ranks = try await getTodayGithubRankUseCase()
            todayGithubRanks = .success(ranks)
        } catch {
            todayGithubRanks = .failure
        }
    }
    
    @MainActor
    func fetchTodayBaekjoonRank() async {
        do {
            todayBaekjoonRanks = .fetching
            let rank = try await getTodaySolvedacRankUseCase()
            todayBaekjoonRanks = .success(rank)
        } catch {
            todayBaekjoonRanks = .failure
        }
    }
    
    @MainActor
    func fetchBestCommunities() async {
        do {
            weekCommunities = .fetching
            let communities = try await getBestCommunitiesUseCase(count: 3)
            weekCommunities = .success(communities)
        } catch {
            weekCommunities = .failure
        }
    }
    
    @MainActor
    public func patchLike(communityId: Int) async {
        guard case .success(var data) = weekCommunities else {
            return
        }
        do {
            try await patchLikeUseCase(communityId: communityId)
            data.enumerated().forEach { idx, i in
                if communityId == i.community.communityId {
                    let added = i.community.liked ? -1 : 1
                    data[idx].community.like += added
                    data[idx].community.liked.toggle()
                }
            }
            self.weekCommunities = .success(data)
        } catch {}
    }
    
    @MainActor
    public func removeCommunity() async {
        guard let selectedRemoveCommunity else {
            removedCommunityFlow = .failure
            return
        }
        do {
            removedCommunityFlow = .fetching
            try await removeCommunityUseCase(id: selectedRemoveCommunity.community.communityId)
            removedCommunityFlow = .success(true)
        } catch {
            removedCommunityFlow = .failure
        }
    }
    
    @MainActor
    func reportCommunity() async {
        
        guard let selectedReportCommunity else {
            return
        }
        
        do {
            let request = ReportCommunityRequest(reason: reportCommunityReason)
            try await reportCommunityUseCase(id: selectedReportCommunity.community.communityId, request)
            reportCommentFlow = .success(true)
        } catch {
            reportCommentFlow = .failure
        }
    }
}
