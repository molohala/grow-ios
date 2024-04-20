import BaseService
import InfoServiceInterface

class InfoDataSourceImpl: BaseRemoteDataSource<InfoDataSourceImpl>, InfoDataSource {
    
    private let path = "info"
    
    func getSolvedav() async throws -> Solvedav {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/solvedac", res: BaseResponse<SolvedavResponse>.self).data.toDomain()
    }
    
    func getGithub() async throws -> Github {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/github", res: BaseResponse<GithubResponse>.self).data.toDomain()
    }
}
