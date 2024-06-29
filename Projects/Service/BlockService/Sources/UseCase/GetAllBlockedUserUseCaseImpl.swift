import BlockServiceInterface

final class GetAllBlockedUserUseCaseImpl: GetAllBlockedUserUseCase {
    
    private let repository: BlockRepository
    
    init(repository: BlockRepository) {
        self.repository = repository
    }
    
    func callAsFunction() async throws -> [BlockedUser] {
        try await repository.getAll()
    }
}
