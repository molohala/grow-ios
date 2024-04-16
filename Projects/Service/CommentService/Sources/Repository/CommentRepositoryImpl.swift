import CommentServiceInterface

class CommentRepositoryImpl: CommentRepository {
    
    private let dataSource: any CommentDataSource
    
    init(dataSource: any CommentDataSource) {
        self.dataSource = dataSource
    }
    
    func getComments(id: Int) async throws -> [Comment] {
        try await dataSource.getComments(id: id)
    }
    
    func createComment(_ req: CreateCommentRequest) async throws {
        try await dataSource.createComment(req)
    }
    
    func patchComment(_ req: PatchCommentRequest) async throws {
        try await dataSource.patchComment(req)
    }
    
    func removeComment(id: Int) async throws {
        try await dataSource.removeComment(id: id)
    }
}
