public protocol GetCommentsUseCase {
    func callAsFunction(id: Int) async throws -> [Comment]
}
