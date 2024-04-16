import CommentServiceInterface

class CommentRepositoryImpl: CommentRepository {
    
    private let commentDataSource: CommentDataSource
    
    init(commentDataSource: CommentDataSource) {
        self.commentDataSource = commentDataSource
    }
    
    func getComments(id: Int) async throws -> [Comment] {
        try await commentDataSource.getComments(id: id)
    }
    
    func createComment(_ req: CreateCommentRequest) async throws {
        try await commentDataSource.createComment(req)
    }
    
    func patchComment(_ req: PatchCommentRequest) async throws {
        try await commentDataSource.patchComment(req)
    }
    
    func removeComment(id: Int) async throws {
        try await commentDataSource.removeComment(id: id)
    }
}
