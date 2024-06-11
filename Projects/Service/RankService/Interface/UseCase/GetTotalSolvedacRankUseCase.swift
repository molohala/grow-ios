public protocol GetTotalSolvedacRankUseCase {
    func callAsFunction() async throws -> [Rank]
}
