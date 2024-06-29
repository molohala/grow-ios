import BlockServiceInterface
import BaseService

final class BlockDataSourceImpl: BaseRemoteDataSource<BlockDataSourceImpl>, BlockDataSource {
    private let path = "block"
    func block(blockUserId: Int) async throws {
        try await requestPost(url: "\(Grow.baseUrl)/\(path)/\(blockUserId)", res: BaseVoidResponse.self)
    }
    
    func allow(blockUserId: Int) async throws {
        try await requestDelete(url: "\(Grow.baseUrl)/\(path)/allow/\(blockUserId)", res: BaseVoidResponse.self)
    }
    
    func getAll() async throws -> [BlockServiceInterface.BlockedUser] {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)", res: BaseResponse<[BlockedUserResponse]>.self)
            .data.map { $0.toDomain() }
    }
}
