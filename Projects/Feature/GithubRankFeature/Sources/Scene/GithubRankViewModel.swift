import Foundation
import RankServiceInterface

public final class GithubRankViewModel: ObservableObject {
    
    enum GithubTab: String, CaseIterable {
        case week = "이번 주"
        case total = "전체"
    }
    
    enum FetchFlow {
        case fetching
        case success
        case failure
    }
    
    // MARK: - UseCases
    private let getTotalGithubRankUseCase: any GetTotalGithubRankUseCase
    private let getWeekGithubRankUseCase: any GetWeekGithubRankUseCase
    
    // MARK: - Properties
    @Published var githubRanks: [Rank] = []
    @Published var githubRanksFlow: FetchFlow = .fetching
    @Published var selectedTab: GithubTab = .week {
        didSet {
            Task {
                githubRanksFlow = .fetching
                await handleGithubRank()
            }
        }
    }
    
    public init(
        getTotalGithubRankUseCase: any GetTotalGithubRankUseCase,
        getWeekGithubRankUseCase: any GetWeekGithubRankUseCase
    ) {
        self.getTotalGithubRankUseCase = getTotalGithubRankUseCase
        self.getWeekGithubRankUseCase = getWeekGithubRankUseCase
    }
    
    func handleGithubRank() async {
        switch selectedTab {
        case .week:
            await fetchWeekGithubRank()
        case .total:
            await fetchTotalGithubRank()
        }
    }
    
    @MainActor
    private func fetchWeekGithubRank() async {
        do {
            githubRanks = try await getWeekGithubRankUseCase()
            githubRanksFlow = .success
        } catch {
            githubRanksFlow = .failure
        }
    }
    
    @MainActor
    private func fetchTotalGithubRank() async {
        do {
            githubRanks = try await getTotalGithubRankUseCase()
            githubRanksFlow = .success
        } catch {
            githubRanksFlow = .failure
        }
    }
}


