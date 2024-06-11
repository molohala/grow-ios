public protocol GetTodaySolvedacRankUseCase {
    func callAsFunction() async throws -> [Rank]
}

