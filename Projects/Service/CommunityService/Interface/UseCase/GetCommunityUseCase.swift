public protocol GetCommunityUseCase {
    func callAsFunction(id: Int) async throws -> CommunityContent
}
