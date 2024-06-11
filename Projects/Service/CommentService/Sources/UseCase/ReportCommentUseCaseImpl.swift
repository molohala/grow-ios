import CommentServiceInterface

class ReportCommentUseCaseImpl: ReportCommentUseCase {
    
    private let commentRepository: CommentRepository
    
    init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }
    
    func callAsFunction(id: Int, _ req: ReportCommentRequest) async throws {
        try await commentRepository.reportComment(id: id, req)
    }
}
