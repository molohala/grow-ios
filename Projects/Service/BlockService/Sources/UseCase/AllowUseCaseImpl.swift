import BlockServiceInterface

final class AllowUseCaseImpl: AllowUseCase {
    
    private let repository: BlockRepository
    
    init(repository: BlockRepository) {
        self.repository = repository
    }
    
    func callAsFunction(blockUserId: Int) async throws {
        try await repository.allow(blockUserId: blockUserId)
    }
}
