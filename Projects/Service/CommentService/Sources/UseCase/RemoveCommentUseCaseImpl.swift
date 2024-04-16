import CommentServiceInterface

class RemoveCommentUseCaseImpl: RemoveCommentUseCase {
    
    private let repository: any CommentRepository
    
    init(repository: any CommentRepository) {
        self.repository = repository
    }
    
    func callAsFunction(id: Int) async throws {
        try await repository.removeComment(id: id)
    }
}
