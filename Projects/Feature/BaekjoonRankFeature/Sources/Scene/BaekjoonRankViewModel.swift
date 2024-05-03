import Foundation
import RankServiceInterface
import BaseFeature

public final class BaekjoonRankViewModel: ObservableObject {
    
    enum BaekjoonTab: String, CaseIterable {
        case week = "이번 주"
        case total = "전체"
    }
    
    // MARK: - UseCases
    private let getTotalSolvedacRankUseCase: any GetTotalSolvedacRankUseCase
    private let getWeekSolvedacRankUseCase: any GetWeekSolvedacRankUseCase
    
    // MARK: - Properties
    @Published var baekjoonRanks: FetchFlow<[Rank]> = .fetching
    @Published var selectedTab: BaekjoonTab = .week {
        didSet {
            Task {
                await handleGithubRank()
            }
        }
    }
    
    public init(
        getTotalSolvedacRankUseCase: any GetTotalSolvedacRankUseCase,
        getWeekSolvedacRankUseCase: any GetWeekSolvedacRankUseCase
    ) {
        self.getTotalSolvedacRankUseCase = getTotalSolvedacRankUseCase
        self.getWeekSolvedacRankUseCase = getWeekSolvedacRankUseCase
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
            baekjoonRanks = .fetching
            let ranks = try await getWeekSolvedacRankUseCase()
            baekjoonRanks = .success(ranks)
        } catch {
            baekjoonRanks = .failure
        }
    }
    
    @MainActor
    private func fetchTotalGithubRank() async {
        do {
            baekjoonRanks = .fetching
            let ranks = try await getTotalSolvedacRankUseCase()
            baekjoonRanks = .success(ranks)
        } catch {
            baekjoonRanks = .failure
        }
    }
}
