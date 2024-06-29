public protocol GetAllBlockedUserUseCase {
    func callAsFunction() async throws -> [BlockedUser]
}
