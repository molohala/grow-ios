public protocol CommentRepository {
    func getComments(id: Int) async throws -> [Comment]
    func createComment(_ req: CreateCommentRequest) async throws
    func patchComment(_ req: PatchCommentRequest) async throws
    func removeComment(id: Int) async throws
}
