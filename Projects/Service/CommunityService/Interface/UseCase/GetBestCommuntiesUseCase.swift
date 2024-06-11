public protocol GetBestCommuntiesUseCase {
    func callAsFunction(count: Int) async throws -> [Community]
}
