import CommentServiceInterface

class CreateCommentUseCaseImpl: CreateCommentUseCase {
    
    private let commentRepository: CommentRepository
    
    init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }
    
    func callAsFunction(_ req: CreateCommentRequest) async throws {
        try await commentRepository.createComment(req)
    }
}
