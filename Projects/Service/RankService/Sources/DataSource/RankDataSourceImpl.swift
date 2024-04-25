import BaseService
import RankServiceInterface

class RankDataSourceImpl: BaseRemoteDataSource<RankDataSourceImpl>, RankDataSource {
    
    private let path = "rank/github"
    
    func getWeekGithubRank() async throws -> [GithubRank] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/week", res: BaseResponse<[GithubRankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTotalGithubRank() async throws -> [GithubRank] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/total", res: BaseResponse<[GithubRankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTodayGithubRank() async throws -> [GithubRank] {
        try await requestGet(url: "\(Infinity.baseUrl)/\(path)/today", res: BaseResponse<[GithubRankResponse]>.self).data.map { $0.toDomain() }
    }
}
