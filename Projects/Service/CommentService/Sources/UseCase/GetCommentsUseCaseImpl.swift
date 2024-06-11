import CommentServiceInterface

class GetCommentsUseCaseImpl: GetCommentsUseCase {
    
    private let commentRepository: CommentRepository
    
    init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }
    
    func callAsFunction(id: Int) async throws -> [Comment] {
        try await commentRepository.getComments(id: id)
    }
}
