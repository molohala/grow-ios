import LikeServiceInterface

class PatchLikeUseCaseImpl: PatchLikeUseCase {
    
    private let repository: LikeRepository
    
    init(repository: LikeRepository) {
        self.repository = repository
    }
    
    func callAsFunction(communityId: Int) async throws {
        try await repository.patchLike(communityId: communityId)
    }
}
