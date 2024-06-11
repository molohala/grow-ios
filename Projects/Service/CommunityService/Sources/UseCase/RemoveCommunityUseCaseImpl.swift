import CommunityServiceInterface

class RemoveCommunityUseCaseImpl: RemoveCommunityUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func callAsFunction(id: Int) async throws {
        try await repository.removeCommunity(id: id)
    }
}
