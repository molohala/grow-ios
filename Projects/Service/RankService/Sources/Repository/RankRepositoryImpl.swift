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
        let ranks = try await rankDataSource.getTodayGithubRank()
        if ranks.count <= 3 {
            return ranks
        }
        return Array(ranks[0..<3])
    }
}
