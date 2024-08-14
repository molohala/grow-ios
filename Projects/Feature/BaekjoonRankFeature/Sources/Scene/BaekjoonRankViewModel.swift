import Foundation
import RankServiceInterface
import BaseFeature

public enum BaekjoonTab: String, CaseIterable {
    case week = "이번 주"
    case total = "전체"
}

public final class BaekjoonRankViewModel: ObservableObject {
   
    // MARK: - UseCases
    private let getTotalSolvedacRankUseCase: any GetTotalSolvedacRankUseCase
    private let getWeekSolvedacRankUseCase: any GetWeekSolvedacRankUseCase
    
    // MARK: - Properties
    @Published var baekjoonRanks: FetchFlow<UpdateRank> = .fetching
    @Published var selectedTab: BaekjoonTab = .week
    
    public init(
        getTotalSolvedacRankUseCase: any GetTotalSolvedacRankUseCase,
        getWeekSolvedacRankUseCase: any GetWeekSolvedacRankUseCase
    ) {
        self.getTotalSolvedacRankUseCase = getTotalSolvedacRankUseCase
        self.getWeekSolvedacRankUseCase = getWeekSolvedacRankUseCase
    }
    
    @MainActor
    func fetchBaekjoonRank() async {
        do {
            baekjoonRanks = .fetching
            let ranks = try await switch selectedTab {
            case .week: getWeekSolvedacRankUseCase()
            case .total: getTotalSolvedacRankUseCase()
            }
            baekjoonRanks = .success(ranks)
        } catch {
            baekjoonRanks = .failure
        }
    }
}
