public protocol CommunityRepository {
    func getCommunities(_ req: PageRequest) async throws -> [Community]
    func createCommunity(_ req: CreateCommunityRequest) async throws
    func patchCommuntiy(_ req: PatchCommunityRequest) async throws
    func getCommunity(id: Int) async throws -> CommunityContent
    func removeCommunity(id: Int) async throws
    func getBestCommunity(count: Int) async throws -> [Community]
    func reportCommunity(id: Int, _ req: ReportCommunityRequest) async throws
}
