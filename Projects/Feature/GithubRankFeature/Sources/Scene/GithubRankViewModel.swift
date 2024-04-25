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
    
    // MARK: - Properties
    @Published var githubRanks: [GithubRank] = []
    @Published var githubRanksFlow: FetchFlow = .fetching
    @Published var selectedTab: GithubTab = .week {
        didSet {
            Task {
                await handleGithubRank()
            }
        }
    }
    
    public init(
        getTotalGithubRankUseCase: any GetTotalGithubRankUseCase
    ) {
        self.getTotalGithubRankUseCase = getTotalGithubRankUseCase
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
            githubRanks = try await getTotalGithubRankUseCase()
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
