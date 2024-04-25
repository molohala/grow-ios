import RankServiceInterface

class RankRepositoryImpl: RankRepository {
    
    private let rankDataSource: any RankDataSource
    
    init(rankDataSource: any RankDataSource) {
        self.rankDataSource = rankDataSource
    }
    
    func getWeekGithubRank() async throws -> [Rank] {
        try await rankDataSource.getWeekGithubRank()
    }
    
    func getTotalGithubRank() async throws -> [Rank] {
        try await rankDataSource.getTotalGithubRank()
    }
    
    func getTodayGithubRank() async throws -> [Rank] {
        try await rankDataSource.getTodayGithubRank()
    }
}
