public protocol GetWeekSolvedacRankUseCase {
    func callAsFunction() async throws -> [Rank]
}
