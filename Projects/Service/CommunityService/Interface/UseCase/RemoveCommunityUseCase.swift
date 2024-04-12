public protocol RemoveCommunityUseCase {
    func callAsFunction(id: Int) async throws
}
