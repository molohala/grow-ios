import LikeServiceInterface

public class PatchLikeUseCaseSpy: PatchLikeUseCase {
    
    public var checkPatchLikeCallCount = 0
    
    public init() {}
    
    public func callAsFunction(communityId: Int) async throws {
        checkPatchLikeCallCount += 1
    }
}
