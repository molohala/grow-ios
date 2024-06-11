public protocol GetProfileByIdUseCase {
    func callAsFunction(memberId: Int) async throws -> Profile
}
