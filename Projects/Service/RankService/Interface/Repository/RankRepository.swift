public protocol RankRepository {
    func getWeekGithubRank() async throws -> [GithubRank]
    func getTotalGithubRank() async throws -> [GithubRank]
    func getTodayGithubRank() async throws -> [GithubRank]
}
