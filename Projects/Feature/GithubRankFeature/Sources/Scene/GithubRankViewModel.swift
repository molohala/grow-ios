import Foundation
import RankServiceInterface
import BaseFeature

public final class GithubRankViewModel: ObservableObject {
    
    enum GithubTab: String, CaseIterable {
        case week = "이번 주"
        case total = "전체"
    }
    
    // MARK: - UseCases
    private let getTotalGithubRankUseCase: any GetTotalGithubRankUseCase
    private let getWeekGithubRankUseCase: any GetWeekGithubRankUseCase
    
    // MARK: - Properties
    @Published var githubRanks: FetchFlow<[Rank]> = .fetching
    @Published var selectedTab: GithubTab = .week {
        didSet {
            Task {
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
            githubRanks = .fetching
            let ranks = try await getWeekGithubRankUseCase()
            githubRanks = .success(ranks)
        } catch {
            githubRanks = .failure
        }
    }
    
    @MainActor
    private func fetchTotalGithubRank() async {
        do {
            githubRanks = .fetching
            let ranks = try await getTotalGithubRankUseCase()
            githubRanks = .success(ranks)
        } catch {
            githubRanks = .failure
        }
    }
}


