import CommentServiceInterface
import BaseService

class CommentDataSourceImpl: BaseRemoteDataSource<CommentDataSourceImpl>, CommentDataSource {
    
    private let path = "comment"
    
    func getComments(id: Int) async throws -> [Comment] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)?communityId=\(id)", res: BaseResponse<[CommentResponse]>.self).data.map { $0.toDomain() }
    }
    
    func createComment(_ req: CreateCommentRequest) async throws {
        try await requestPost(url: "\(Infinity.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func patchComment(_ req: PatchCommentRequest) async throws {
        try await requestPatch(url: "\(Infinity.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func removeComment(id: Int) async throws {
        try await requestDelete(url: "\(Infinity.baseUrl)/\(path)/\(id)", res: BaseVoidResponse.self)
    }
}
