public protocol GetWeekGithubRankUseCase {
    func callAsFunction() async throws -> [Rank]
}
