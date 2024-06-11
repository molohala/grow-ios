public protocol GetLikeCountUseCase {
    func callAsFunction(communityId: Int) async throws -> Int
}
