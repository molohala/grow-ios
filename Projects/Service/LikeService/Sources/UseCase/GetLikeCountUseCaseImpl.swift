import LikeServiceInterface

class GetLikeCountUseCaseImpl: GetLikeCountUseCase {
    
    private let repository: LikeRepository
    
    init(repository: LikeRepository) {
        self.repository = repository
    }
    
    func callAsFunction(communityId: Int) async throws -> Int {
        try await repository.getLikeCount(communityId: communityId)
    }
}
