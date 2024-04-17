import CommunityServiceInterface
import Foundation

public class GetCommunityUseCaseSpy: GetCommunityUseCase {
    
    public init() {}
    
    public var checkGetCommunityCallCount = 0
    
    public func callAsFunction(id: Int) async throws -> Community {
        sleep(2)
        checkGetCommunityCallCount += 1
        return .init(communityId: 1, content: "테스트더미더미더미더미더미덤디ㅓㅁ", createdAt: .now.addingTimeInterval(-1000), like: 3, writerId: 3, writerName: "노영재", liked: true)
    }
}
