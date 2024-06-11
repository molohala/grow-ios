public protocol GetProfileUseCase {
    func callAsFunction() async throws -> Profile
}
