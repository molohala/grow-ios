import BlockServiceInterface

final class BlockUseCaseImpl: BlockUseCase {
    
    private let repository: BlockRepository
    
    init(repository: BlockRepository) {
        self.repository = repository
    }
    
    func callAsFunction(blockUserId: Int) async throws {
        try await repository.block(blockUserId: blockUserId)
    }
}
