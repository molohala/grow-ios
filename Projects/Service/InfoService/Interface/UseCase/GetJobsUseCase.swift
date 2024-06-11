public protocol GetJobsUseCase {
    func callAsFunction() async throws -> [String]
}
