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
    
    // MARK: - Properties
    @Published var weekCommunities: [Community] = []
    @Published var selectedCommunity: Community?
    
    @Published var todayGithubRanks: [GithubRank] = []
    @Published var todayGithubRanksFlow: FetchFlow = .fetching
    
    public init(
        getTodayGithubRankUseCase: any GetTodayGithubRankUseCase
    ) {
        self.getTodayGithubRankUseCase = getTodayGithubRankUseCase
    }
    
    @MainActor
    func fetchTodayGithubRank() async {
        do {
            todayGithubRanks = try await getTodayGithubRankUseCase()
            todayGithubRanksFlow = .success
        } catch {
            print(error)
            todayGithubRanksFlow = .failure
        }
    }
}
