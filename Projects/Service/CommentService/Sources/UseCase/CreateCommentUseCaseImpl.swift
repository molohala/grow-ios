import CommentServiceInterface

class CreateCommentUseCaseImpl: CreateCommentUseCase {
    
    private let repository: any CommentRepository
    
    init(repository: any CommentRepository) {
        self.repository = repository
    }
    
    func callAsFunction(_ req: CreateCommentRequest) async throws {
        try await repository.createComment(req)
    }
}
