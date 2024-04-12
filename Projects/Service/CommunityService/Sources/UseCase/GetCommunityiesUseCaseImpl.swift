import CommunityServiceInterface

class GetCommunityiesUseCaseImpl: GetCommunityUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func callAsFunction(id: Int) async throws -> Community {
        try await repository.getCommunity(id: id)
    }
}
