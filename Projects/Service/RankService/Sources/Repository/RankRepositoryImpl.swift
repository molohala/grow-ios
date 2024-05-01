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
        let ranks = try await rankDataSource.getTodayGithubRank()
        if ranks.count <= 3 {
            return ranks
        }
        return Array(ranks[0..<3])
    }
    
    func getWeekSolvedacRank() async throws -> [Rank] {
        try await rankDataSource.getWeekSolvedacRank()
    }
    
    func getTotalSolvedacRank() async throws -> [Rank] {
        try await rankDataSource.getTotalSolvedacRank()
    }
    
    func getTodaySolvedacRank() async throws -> [Rank] {
        let ranks = try await rankDataSource.getTodaySolvedacRank()
        if ranks.count <= 3 {
            return ranks
        }
        return Array(ranks[0..<3])
    }
}
