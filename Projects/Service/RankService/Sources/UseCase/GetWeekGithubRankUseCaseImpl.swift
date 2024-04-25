import RankServiceInterface

class GetWeekGithubRankUseCaseImpl: GetWeekGithubRankUseCase {
    
    private let rankRepository: any RankRepository
    
    init(rankRepository: any RankRepository) {
        self.rankRepository = rankRepository
    }
    
    func callAsFunction() async throws -> [GithubRank] {
        try await rankRepository.getWeekGithubRank()
    }
}
