import Foundation
import CommunityServiceInterface
import RankServiceInterface

public final class HomeViewModel: ObservableObject {
    
    enum FetchFlow {
        case fetching
        case success
        case failure
    }
    
    // MARK: - UseCases
    private let getTodayGithubRankUseCase: any GetTodayGithubRankUseCase
    private let getTodaySolvedacRankUseCase: any GetTodaySolvedacRankUseCase
    private let getBestCommunitiesUseCase: any GetBestCommuntiesUseCase
    
    // MARK: - Properties
    @Published var weekCommunities: [Community] = []
    @Published var weekCommunitiesFlow: FetchFlow = .fetching
    @Published var selectedCommunity: Community?
    
    @Published var todayGithubRanks: [Rank] = []
    @Published var todayGithubRanksFlow: FetchFlow = .fetching
    
    @Published var todayBaekjoonRanks: [Rank] = []
    @Published var todayBaekjoonRanksFlow: FetchFlow = .fetching
    
    public init(
        getTodayGithubRankUseCase: any GetTodayGithubRankUseCase,
        getTodaySolvedacRankUseCase: any GetTodaySolvedacRankUseCase,
        getBestCommunitiesUseCase: any GetBestCommuntiesUseCase
    ) {
        self.getTodayGithubRankUseCase = getTodayGithubRankUseCase
        self.getTodaySolvedacRankUseCase = getTodaySolvedacRankUseCase
        self.getBestCommunitiesUseCase = getBestCommunitiesUseCase
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
}
