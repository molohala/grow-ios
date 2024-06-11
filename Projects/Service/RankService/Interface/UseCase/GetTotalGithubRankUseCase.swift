public protocol GetTotalGithubRankUseCase {
    func callAsFunction() async throws -> [Rank]
}
