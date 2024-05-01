import Foundation
import RankServiceInterface

public final class BaekjoonRankViewModel: ObservableObject {
    
    enum BaekjoonTab: String, CaseIterable {
        case week = "이번 주"
        case total = "전체"
    }
    
    enum FetchFlow {
        case fetching
        case success
        case failure
    }
    
    // MARK: - UseCases
    private let getTotalSolvedacRankUseCase: any GetTotalSolvedacRankUseCase
    private let getWeekSolvedacRankUseCase: any GetWeekSolvedacRankUseCase
    
    // MARK: - Properties
    @Published var baekjoonRanks: [Rank] = []
    @Published var baekjoonRanksFlow: FetchFlow = .fetching
    @Published var selectedTab: BaekjoonTab = .week {
        didSet {
            Task {
                baekjoonRanksFlow = .fetching
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
            baekjoonRanks = try await getWeekSolvedacRankUseCase()
            baekjoonRanksFlow = .success
        } catch {
            baekjoonRanksFlow = .failure
        }
    }
    
    @MainActor
    private func fetchTotalGithubRank() async {
        do {
            baekjoonRanks = try await getTotalSolvedacRankUseCase()
            baekjoonRanksFlow = .success
        } catch {
            baekjoonRanksFlow = .failure
        }
    }
}
