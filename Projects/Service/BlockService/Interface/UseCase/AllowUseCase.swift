public protocol AllowUseCase {
    func callAsFunction(blockUserId: Int) async throws
}
