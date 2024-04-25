public protocol RankRepository {
    func getWeekGithubRank() async throws -> [Rank]
    func getTotalGithubRank() async throws -> [Rank]
    func getTodayGithubRank() async throws -> [Rank]
}
