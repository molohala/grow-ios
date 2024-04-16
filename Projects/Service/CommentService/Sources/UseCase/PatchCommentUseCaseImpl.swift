import CommentServiceInterface

class PatchCommentUseCaseImpl: PatchCommentUseCase {
    
    private let repository: any CommentRepository
    
    init(repository: any CommentRepository) {
        self.repository = repository
    }
    
    func callAsFunction(_ req: PatchCommentRequest) async throws {
        try await repository.patchComment(req)
    }
}
