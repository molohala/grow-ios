import BaseService
import CommunityServiceInterface

class CommunityDataSourceImpl: BaseRemoteDataSource<CommunityDataSourceImpl>, CommunityDataSource {
    
    private let path = "community"
    
    func getCommunities(_ req: PageRequest) async throws -> [Community] {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)?page=\(req.page)&size=\(req.size)", res: BaseResponse<[CommunityResponse]>.self).data.map { $0.toDomain() }
    }
    
    func createCommunity(_ req: CreateCommunityRequest) async throws {
        _ = try await requestPost(url: "\(Grow.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func patchCommuntiy(_ req: PatchCommunityRequest) async throws {
        _ = try await requestPatch(url: "\(Grow.baseUrl)/\(path)", req: req, res: BaseVoidResponse.self)
    }
    
    func getCommunity(id: Int) async throws -> CommunityContent {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/\(id)", res: BaseResponse<CommunityContentResponse>.self).data.toDomain()
    }
    
    func removeCommunity(id: Int) async throws {
        _ = try await requestDelete(url: "\(Grow.baseUrl)/\(path)/\(id)", res: BaseVoidResponse.self)
    }
    
    func getBestCommunities(count: Int) async throws -> [Community] {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/best?count=\(count)", res: BaseResponse<[CommunityResponse]>.self).data.map { $0.toDomain() }
    }
    
    func reportCommunity(id: Int, _ req: ReportCommunityRequest) async throws {
        try await requestPost(url: "\(Grow.baseUrl)/\(path)/\(id)/report", req: req, res: BaseVoidResponse.self)
    }
}
