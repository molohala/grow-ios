import RankServiceInterface

class GetTodaySolvedacRankUseCaseImpl: GetTodaySolvedacRankUseCase {
    
    private let rankRepository: any RankRepository
    
    init(rankRepository: any RankRepository) {
        self.rankRepository = rankRepository
    }
    
    func callAsFunction() async throws -> UpdateRank {
        try await rankRepository.getTodaySolvedacRank()
    }
}
