import BlockServiceInterface

final class BlockRepositoryImpl: BlockRepository {
    private let dataSource: BlockDataSource
    
    init(dataSource: BlockDataSource) {
        self.dataSource = dataSource
    }
    
    func block(blockUserId: Int) async throws {
        try await dataSource.block(blockUserId: blockUserId)
    }
    
    func allow(blockUserId: Int) async throws {
        try await dataSource.allow(blockUserId: blockUserId)
    }
    
    func getAll() async throws -> [BlockedUser] {
        try await dataSource.getAll()
    }
}
