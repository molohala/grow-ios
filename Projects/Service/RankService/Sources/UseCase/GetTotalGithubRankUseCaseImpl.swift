import RankServiceInterface

class GetTotalGithubRankUseCaseImpl: GetTotalGithubRankUseCase {
    
    private let rankRepository: any RankRepository
    
    init(rankRepository: any RankRepository) {
        self.rankRepository = rankRepository
    }
    
    func callAsFunction() async throws -> UpdateRank {
        try await rankRepository.getTotalGithubRank()
    }
}
