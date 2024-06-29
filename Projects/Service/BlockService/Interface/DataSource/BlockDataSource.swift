public protocol BlockDataSource {
    func block(blockUserId: Int) async throws
    func allow(blockUserId: Int) async throws
    func getAll() async throws -> [BlockedUser]
}
