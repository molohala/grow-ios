public protocol PatchLikeUseCase {
    func callAsFunction(communityId: Int) async throws
}
