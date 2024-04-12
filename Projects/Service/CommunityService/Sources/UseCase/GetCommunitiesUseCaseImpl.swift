import CommunityServiceInterface

class GetCommunitiesUseCaseImpl: GetCommunitiesUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func callAsFunction(_ req: PageRequest) async throws -> [Community] {
        try await repository.getCommunities(req)
    }
}
