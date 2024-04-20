public protocol GetGithubUseCase {
    func callAsFunction() async throws -> Github
}
