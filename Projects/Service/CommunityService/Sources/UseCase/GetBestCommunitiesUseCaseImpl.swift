import CommunityServiceInterface

class GetBestCommunitiesUseCaseImpl: GetBestCommuntiesUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func callAsFunction(count: Int) async throws -> [Community] {
        try await repository.getBestCommunity(count: count)
    }
}
