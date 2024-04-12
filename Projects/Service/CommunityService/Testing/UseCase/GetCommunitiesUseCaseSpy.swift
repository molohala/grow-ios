import CommunityServiceInterface

public class GetCommunitiesUseCaseSpy: GetCommunitiesUseCase {
    
    public init() {}
    
    public var checkGetCommunitiesCallCount = 0
    public func callAsFunction(_ req: PageRequest) async throws -> [Community] {
        checkGetCommunitiesCallCount += 1
        return [
            .init(communityId: 0, content: "정말 반갑습니당", createdAt: "1시간 전", like: 2, writer: "노영재"),
            .init(communityId: 1, content: "정말 반갑습니당", createdAt: "1시간 전", like: 2, writer: "노영재"),
            .init(communityId: 2, content: "정말 반갑습니당", createdAt: "1시간 전", like: 2, writer: "노영재"),
            .init(communityId: 3, content: "정말 반갑습니당", createdAt: "1시간 전", like: 2, writer: "노영재"),
            .init(communityId: 4, content: "정말 반갑습니당", createdAt: "1시간 전", like: 2, writer: "노영재"),
            .init(communityId: 5, content: "정말 반갑습니당", createdAt: "1시간 전", like: 2, writer: "노영재")
        ]
    }
}
