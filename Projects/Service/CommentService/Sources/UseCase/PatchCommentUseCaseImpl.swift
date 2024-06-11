import CommentServiceInterface

class PatchCommentUseCaseImpl: PatchCommentUseCase {
    
    private let commentRepository: CommentRepository
    
    init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }
    
    func callAsFunction(_ req: PatchCommentRequest) async throws {
        try await commentRepository.patchComment(req)
    }
}
