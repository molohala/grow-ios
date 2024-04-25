public protocol GetWeekGithubRankUseCase {
    func callAsFunction() async throws -> [GithubRank]
}
