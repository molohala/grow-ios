import CommunityServiceInterface

class CommunityRepositoryImpl: CommunityRepository {
    
    private let dataSource: CommunityDataSource
    
    init(dataSource: CommunityDataSource) {
        self.dataSource = dataSource
    }
    
    func getCommunityies(_ req: PageRequest) async throws -> [Community] {
        try await dataSource.getCommunityies(req)
    }
    
    func createCommunity(_ req: CreateCommunityRequest) async throws {
        try await dataSource.createCommunity(req)
    }
    
    func patchCommuntiy(_ req: PatchCommunityRequest) async throws {
        try await dataSource.patchCommuntiy(req)
    }
    
    func getCommunity(id: Int) async throws -> Community {
        try await dataSource.getCommunity(id: id)
    }
    
    func removeCommunity(id: Int) async throws {
        try await dataSource.removeCommunity(id: id)
    }
}
