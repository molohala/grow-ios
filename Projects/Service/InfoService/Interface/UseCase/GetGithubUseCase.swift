public protocol GetGithubUseCase {
    func callAsFunction(name: String) async throws -> Github
}
