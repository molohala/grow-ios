import BaseService
import CommunityServiceInterface

class CommunityDataSourceImpl: BaseRemoteDataSource<CommunityDataSourceImpl>, CommunityDataSource {
    
    private let path = "community"
    
    func getCommunityies(_ req: PageRequest) async throws -> [Community] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)", req: req, BaseResponse<[CommunityResponse]>.self).data.map { $0.toDomain() }
    }
    
    func createCommunity(_ req: CreateCommunityRequest) async throws {
        _ = try await requestPost(url: "\(Infinity.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func patchCommuntiy(_ req: PatchCommunityRequest) async throws {
        _ = try await requestPatch(url: "\(Infinity.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func getCommunity(id: Int) async throws -> Community {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/\(id)", res: BaseResponse<CommunityResponse>.self).data.toDomain()
    }
    
    func removeCommunity(id: Int) async throws {
        _ = try await requestGet(url: "\(Infinity.baseUrl)/\(path)/\(id)", res: BaseVoidResponse.self)
    }
}
