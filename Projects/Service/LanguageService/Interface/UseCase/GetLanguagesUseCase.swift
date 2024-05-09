public protocol GetLanguagesUseCase {
    func callAsFunction() async throws -> [Language]
}
