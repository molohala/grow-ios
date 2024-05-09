public protocol GetMyLanguagesUseCase {
    func callAsFunction() async throws -> [Language]
}
