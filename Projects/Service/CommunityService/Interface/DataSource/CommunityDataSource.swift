import BaseService

public protocol CommunityDataSource {
    func getCommunityies(_ req: PageRequest) async throws -> [Community]
    func createCommunity(_ req: CreateCommunityRequest) async throws
    func patchCommuntiy(_ req: PatchCommunityRequest) async throws
    func getCommunity(id: Int) async throws -> Community
    func removeCommunity(id: Int) async throws
}
