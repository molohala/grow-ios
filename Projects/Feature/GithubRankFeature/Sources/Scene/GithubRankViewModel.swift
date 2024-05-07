import Foundation
import RankServiceInterface
import BaseFeature

public enum GithubTab: String, CaseIterable {
    case week = "이번 주"
    case total = "전체"
}

public final class GithubRankViewModel: ObservableObject {
   
    // MARK: - UseCases
    private let getTotalGithubRankUseCase: any GetTotalGithubRankUseCase
    private let getWeekGithubRankUseCase: any GetWeekGithubRankUseCase
    
    // MARK: - Properties
    @Published var githubRanks: FetchFlow<[Rank]> = .fetching
    @Published var selectedTab: GithubTab = .week
    
    public init(
        getTotalGithubRankUseCase: any GetTotalGithubRankUseCase,
        getWeekGithubRankUseCase: any GetWeekGithubRankUseCase
    ) {
        self.getTotalGithubRankUseCase = getTotalGithubRankUseCase
        self.getWeekGithubRankUseCase = getWeekGithubRankUseCase
    }
    
    @MainActor
    func fetchGithubRank() async {
        do {
            githubRanks = .fetching
            let ranks = try await switch selectedTab {
            case .week: getWeekGithubRankUseCase()
            case .total: getTotalGithubRankUseCase()
            }
            githubRanks = .success(ranks)
        } catch {
            githubRanks = .failure
        }
    }
}
