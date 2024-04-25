public protocol GetTodayGithubRankUseCase {
    func callAsFunction() async throws -> [GithubRank]
}
