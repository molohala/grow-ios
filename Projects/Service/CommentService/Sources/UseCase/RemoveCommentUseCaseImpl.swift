import CommentServiceInterface

class RemoveCommentUseCaseImpl: RemoveCommentUseCase {
    
    private let commentRepository: CommentRepository
    
    init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }
    
    func callAsFunction(id: Int) async throws {
        try await commentRepository.removeComment(id: id)
    }
}
