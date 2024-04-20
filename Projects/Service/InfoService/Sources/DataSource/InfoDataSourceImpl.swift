import BaseService
import InfoServiceInterface

class InfoDataSourceImpl: BaseRemoteDataSource<InfoDataSourceImpl>, InfoDataSource {
    
    private let path = "info"
    
    func getSolvedav(name: String) async throws -> Solvedav {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/solvedac?name=\(name)", res: BaseResponse<SolvedavResponse>.self).data.toDomain()
    }
    
    func getGithub(name: String) async throws -> Github {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/github?name=\(name)", res: BaseResponse<GithubResponse>.self).data.toDomain()
    }
}
