import CommunityServiceInterface

class CommunityRepositoryImpl: CommunityRepository {
    
    private let dataSource: CommunityDataSource
    
    init(dataSource: CommunityDataSource) {
        self.dataSource = dataSource
    }
    
    func getCommunities(_ req: PageRequest) async throws -> [Community] {
        try await dataSource.getCommunities(req).sorted { $0.community.createdAt > $1.community.createdAt }
    }
    
    func createCommunity(_ req: CreateCommunityRequest) async throws {
        try await dataSource.createCommunity(req)
    }
    
    func patchCommuntiy(_ req: PatchCommunityRequest) async throws {
        try await dataSource.patchCommuntiy(req)
    }
    
    func getCommunity(id: Int) async throws -> CommunityContent {
        try await dataSource.getCommunity(id: id)
    }
    
    func removeCommunity(id: Int) async throws {
        try await dataSource.removeCommunity(id: id)
    }
    
    func getBestCommunity(count: Int) async throws -> [Community] {
        try await dataSource.getBestCommunities(count: count)
    }
}
