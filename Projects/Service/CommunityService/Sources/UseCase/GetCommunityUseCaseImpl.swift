import CommunityServiceInterface

class GetCommunityUseCaseImpl: GetCommunityUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func callAsFunction(id: Int) async throws -> CommunityContent {
        try await repository.getCommunity(id: id)
    }
}
