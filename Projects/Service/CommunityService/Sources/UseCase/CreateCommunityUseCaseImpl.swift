import CommunityServiceInterface

class CreateCommunityUseCaseImpl: CreateCommunityUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func callAsFunction(_ req: CreateCommunityRequest) async throws {
        try await repository.createCommunity(req)
    }
}
