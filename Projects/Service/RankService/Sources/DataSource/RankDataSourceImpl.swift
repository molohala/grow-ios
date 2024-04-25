import BaseService
import RankServiceInterface

class RankDataSourceImpl: BaseRemoteDataSource<RankDataSourceImpl>, RankDataSource {
    
    private let path = "rank/github"
    
    func getWeekGithubRank() async throws -> [Rank] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/week", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTotalGithubRank() async throws -> [Rank] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/total", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTodayGithubRank() async throws -> [Rank] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/today", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
}
