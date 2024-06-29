public protocol BlockUseCase {
    func callAsFunction(blockUserId: Int) async throws
}
