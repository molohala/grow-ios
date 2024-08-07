import CommunityServiceInterface
import Foundation

public class GetCommunitiesUseCaseSpy: GetCommunitiesUseCase {
    
    public init() {}
    
    public var checkGetCommunitiesCallCount = 0
    public func callAsFunction(_ req: PageRequest) async throws -> [Community] {
        sleep(2)
        checkGetCommunitiesCallCount += 1
        return [
            .init(communityId: 0, content: "정말 반갑습니당", createdAt: .now.addingTimeInterval(-1000), like: 2, writerId: 1, writerName: "노영재", liked: true),
            .init(communityId: 1, content: "정말 반갑습니당", createdAt: .now.addingTimeInterval(-10000), like: 2, writerId: 1, writerName: "노영재", liked: false),
            .init(communityId: 2, content: "정말 반갑습니당", createdAt: .now.addingTimeInterval(-10), like: 2, writerId: 1, writerName: "노영재", liked: false),
            .init(communityId: 3, content: "정말 반갑습니당", createdAt: .now.addingTimeInterval(-183), like: 2, writerId: 1, writerName: "노영재", liked: true),
            .init(communityId: 4, content: "정말 반갑습니당", createdAt: .now.addingTimeInterval(-100000), like: 2, writerId: 1, writerName: "노영재", liked: false),
            .init(communityId: 5, content: "정말 반갑습니당", createdAt: .now.addingTimeInterval(-1000000), like: 2, writerId: 1, writerName: "노영재", liked: false)
        ]
    }
}
