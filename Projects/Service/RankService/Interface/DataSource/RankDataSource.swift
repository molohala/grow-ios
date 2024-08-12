public protocol RankDataSource {
    func getWeekGithubRank() async throws -> UpdateRank
    func getTotalGithubRank() async throws -> UpdateRank
    func getTodayGithubRank() async throws -> UpdateRank
    
    func getWeekSolvedacRank() async throws -> UpdateRank
    func getTotalSolvedacRank() async throws -> UpdateRank
    func getTodaySolvedacRank() async throws -> UpdateRank
}
