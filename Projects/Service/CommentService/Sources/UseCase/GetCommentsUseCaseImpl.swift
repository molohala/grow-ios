import CommentServiceInterface

class GetCommentsUseCaseImpl: GetCommentsUseCase {
    
    private let repository: any CommentRepository
    
    init(repository: any CommentRepository) {
        self.repository = repository
    }
    
    func callAsFunction(id: Int) async throws -> [Comment] {
        try await repository.getComments(id: id)
    }
}
