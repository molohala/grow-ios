public protocol GetTotalGithubRankUseCase {
    func callAsFunction() async throws -> [GithubRank]
}
