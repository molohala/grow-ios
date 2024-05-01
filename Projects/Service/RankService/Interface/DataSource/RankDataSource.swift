public protocol RankDataSource {
    func getWeekGithubRank() async throws -> [Rank]
    func getTotalGithubRank() async throws -> [Rank]
    func getTodayGithubRank() async throws -> [Rank]
    
    func getWeekSolvedacRank() async throws -> [Rank]
    func getTotalSolvedacRank() async throws -> [Rank]
    func getTodaySolvedacRank() async throws -> [Rank]
}
