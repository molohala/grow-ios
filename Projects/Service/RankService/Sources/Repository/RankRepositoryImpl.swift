import RankServiceInterface

class RankRepositoryImpl: RankRepository {
    
    private let rankDataSource: any RankDataSource
    
    init(rankDataSource: any RankDataSource) {
        self.rankDataSource = rankDataSource
    }
    
    func getWeekGithubRank() async throws -> UpdateRank {
        try await rankDataSource.getWeekGithubRank()
    }
    
    func getTotalGithubRank() async throws -> UpdateRank {
        try await rankDataSource.getTotalGithubRank()
    }
    
    func getTodayGithubRank() async throws -> UpdateRank {
        var ranks = try await rankDataSource.getTodayGithubRank()
        if ranks.ranks.count > 3 {
            ranks.ranks = Array(ranks.ranks[0..<3])
        }
        return ranks
    }
    
    func getWeekSolvedacRank() async throws -> UpdateRank {
        try await rankDataSource.getWeekSolvedacRank()
    }
    
    func getTotalSolvedacRank() async throws -> UpdateRank {
        try await rankDataSource.getTotalSolvedacRank()
    }
    
    func getTodaySolvedacRank() async throws -> UpdateRank {
        var ranks = try await rankDataSource.getTodaySolvedacRank()
        if ranks.ranks.count > 3 {
            ranks.ranks = Array(ranks.ranks[0..<3])
        }
        return ranks
    }
}
