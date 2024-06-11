import CommentServiceInterface
import BaseService

class CommentDataSourceImpl: BaseRemoteDataSource<CommentDataSourceImpl>, CommentDataSource {
    
    private let path = "comment"
    
    func getComments(id: Int) async throws -> [Comment] {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)?communityId=\(id)", res: BaseResponse<[CommentResponse]>.self).data.map { $0.toDomain() }
    }
    
    func createComment(_ req: CreateCommentRequest) async throws {
        try await requestPost(url: "\(Grow.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func patchComment(_ req: PatchCommentRequest) async throws {
        try await requestPatch(url: "\(Grow.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func removeComment(id: Int) async throws {
        try await requestDelete(url: "\(Grow.baseUrl)/\(path)/\(id)", res: BaseVoidResponse.self)
    }
    
    func reportComment(id: Int, _ req: ReportCommentRequest) async throws {
        try await requestPost(url: "\(Grow.baseUrl)/\(path)/\(id)/report", req: req, res: BaseVoidResponse.self)
    }
}
