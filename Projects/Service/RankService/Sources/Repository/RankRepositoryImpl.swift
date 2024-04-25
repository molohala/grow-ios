import RankServiceInterface

class RankRepositoryImpl: RankRepository {
    
    private let rankDataSource: any RankDataSource
    
    init(rankDataSource: any RankDataSource) {
        self.rankDataSource = rankDataSource
    }
    
    func getWeekGithubRank() async throws -> [GithubRank] {
        try await rankDataSource.getWeekGithubRank()
    }
    
    func getTotalGithubRank() async throws -> [GithubRank] {
        try await rankDataSource.getTotalGithubRank()
    }
    
    func getTodayGithubRank() async throws -> [GithubRank] {
        try await rankDataSource.getTodayGithubRank()
    }
}
