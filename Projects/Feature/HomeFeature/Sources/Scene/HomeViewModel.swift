import Foundation
import CommunityServiceInterface
import RankServiceInterface
import LikeServiceInterface

public final class HomeViewModel: ObservableObject {
    
    enum FetchFlow {
        case fetching
        case success
        case failure
    }
    
    enum DeleteFlow {
        case idle
        case checking
        case fetching
        case success
        case failure
    }
    
    // MARK: - UseCases
    private let getTodayGithubRankUseCase: any GetTodayGithubRankUseCase
    private let getTodaySolvedacRankUseCase: any GetTodaySolvedacRankUseCase
    private let getBestCommunitiesUseCase: any GetBestCommuntiesUseCase
    private let patchLikeUseCase: any PatchLikeUseCase
    private let removeCommunityUseCase: any RemoveCommunityUseCase
    
    // MARK: - Properties
    @Published var weekCommunities: [Community] = []
    @Published var weekCommunitiesFlow: FetchFlow = .fetching
    @Published var selectedCommunity: Community?
    
    @Published var todayGithubRanks: [Rank] = []
    @Published var todayGithubRanksFlow: FetchFlow = .fetching
    
    @Published var todayBaekjoonRanks: [Rank] = []
    @Published var todayBaekjoonRanksFlow: FetchFlow = .fetching
    
    @Published var removedCommunityFlow: FetchFlow = .fetching
    @Published var removedCommunity: Community?
    
    public init(
        getTodayGithubRankUseCase: any GetTodayGithubRankUseCase,
        getTodaySolvedacRankUseCase: any GetTodaySolvedacRankUseCase,
        getBestCommunitiesUseCase: any GetBestCommuntiesUseCase,
        patchLikeUseCase: any PatchLikeUseCase,
        removeCommunityUseCase: any RemoveCommunityUseCase
    ) {
        self.getTodayGithubRankUseCase = getTodayGithubRankUseCase
        self.getTodaySolvedacRankUseCase = getTodaySolvedacRankUseCase
        self.getBestCommunitiesUseCase = getBestCommunitiesUseCase
        self.patchLikeUseCase = patchLikeUseCase
        self.removeCommunityUseCase = removeCommunityUseCase
    }
    
    @MainActor
    func fetchTodayGithubRank() async {
        do {
            todayBaekjoonRanksFlow = .fetching
            todayGithubRanks = try await getTodayGithubRankUseCase()
            todayGithubRanksFlow = .success
        } catch {
            todayGithubRanksFlow = .failure
        }
    }
    
    @MainActor
    func fetchTodayBaekjoonRank() async {
        do {
            todayBaekjoonRanksFlow = .fetching
            todayBaekjoonRanks = try await getTodaySolvedacRankUseCase()
            todayBaekjoonRanksFlow = .success
        } catch {
            todayBaekjoonRanksFlow = .failure
        }
    }
    
    @MainActor
    func fetchBestCommunities() async {
        do {
            weekCommunitiesFlow = .fetching
            weekCommunities = try await getBestCommunitiesUseCase(count: 3)
            weekCommunitiesFlow = .success
        } catch {
            weekCommunitiesFlow = .failure
        }
    }
    
    @MainActor
    public func patchLike(communityId: Int) async {
        do {
            try await patchLikeUseCase(communityId: communityId)
            weekCommunities.enumerated().forEach { idx, i in
                if communityId == i.community.communityId {
                    weekCommunities[idx].community.like += i.community.liked ? -1 : 1
                    weekCommunities[idx].community.liked.toggle()
                }
            }
        } catch {}
    }
    
    @MainActor
    public func removeCommunity() async {
        do {
            guard let removedCommunity else {
                removedCommunityFlow = .failure
                return
            }
            removedCommunityFlow = .fetching
            try await removeCommunityUseCase(id: removedCommunity.community.communityId)
            removedCommunityFlow = .success
        } catch {
            removedCommunityFlow = .failure
        }
    }
}
