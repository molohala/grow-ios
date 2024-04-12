import CommunityServiceInterface

class PatchCommunityUseCaseImpl: PatchCommunityUseCase {
    
    private let repository: CommunityRepository
    
    init(repository: CommunityRepository) {
        self.repository = repository
    }
    
    func callAsFunction(_ req: PatchCommunityRequest) async throws {
        try await repository.patchCommuntiy(req)
    }
}
