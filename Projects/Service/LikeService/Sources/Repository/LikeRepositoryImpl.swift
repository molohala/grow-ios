import LikeServiceInterface

class LikeRepositoryImpl: LikeRepository {
    
    private let dataSource: LikeDataSource
    
    init(dataSource: LikeDataSource) {
        self.dataSource = dataSource
    }
    
    func getLikeCount(communityId: Int) async throws -> Int {
        try await dataSource.getLikeCount(communityId: communityId)
    }
    
    func patchLike(communityId: Int) async throws {
        try await dataSource.patchLike(communityId: communityId)
    }
}
