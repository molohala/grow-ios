import LanguageServiceInterface
import BaseService

class LanguageDataSourceImpl: BaseRemoteDataSource<LanguageDataSourceImpl>, LanguageDataSource {
    
    private let path = "language"
    
    func getMyLanguages() async throws -> [Language] {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/me", res: BaseResponse<[LanguageResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getLanguages() async throws -> [Language] {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)", res: BaseResponse<[LanguageResponse]>.self).data.map { $0.toDomain() }
    }
    
    func patchMyLanguages(_ req: PatchMyLanguagesRequest) async throws {
        try await requestPatch(url: "\(Grow.baseUrl)/\(path)/me", req: req, res: BaseVoidResponse.self)
    }
}
