public protocol LikeDataSource {
    func getLikeCount(communityId: Int) async throws -> Int
    func patchLike(communityId: Int) async throws
}
