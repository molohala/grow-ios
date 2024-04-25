public protocol RankDataSource {
    func getWeekGithubRank() async throws -> [GithubRank]
    func getTotalGithubRank() async throws -> [GithubRank]
    func getTodayGithubRank() async throws -> [GithubRank]
}

