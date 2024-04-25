import RankServiceInterface

class GetTodayGithubRankUseCaseImpl: GetTodayGithubRankUseCase {
    
    private let rankRepository: any RankRepository
    
    init(rankRepository: any RankRepository) {
        self.rankRepository = rankRepository
    }
    
    func callAsFunction() async throws -> [GithubRank] {
        try await rankRepository.getTodayGithubRank()
    }
}
