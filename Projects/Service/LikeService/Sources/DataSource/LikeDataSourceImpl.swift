import LikeServiceInterface
import BaseService

class LikeDataSourceImpl: BaseRemoteDataSource<LikeDataSourceImpl>, LikeDataSource {
    
    private let path = "like"
    
    func getLikeCount(communityId: Int) async throws -> Int {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/\(communityId)", res: Int.self)
    }
    
    func patchLike(communityId: Int) async throws {
        _ = try await requestPatch(url: "\(Grow.baseUrl)/\(path)/\(communityId)", res: BaseVoidResponse.self)
    }
}
