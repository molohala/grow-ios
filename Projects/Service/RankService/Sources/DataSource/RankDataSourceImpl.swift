import BaseService
import RankServiceInterface

class RankDataSourceImpl: BaseRemoteDataSource<RankDataSourceImpl>, RankDataSource {
    private let githubPath = "rank/github"
    private let solvedacPath = "rank/solvedac"
    
    func getWeekGithubRank() async throws -> UpdateRank {
        try await requestGet(url: "\(Grow.baseUrl)/\(githubPath)/week", res: BaseResponse<UpdateRankResponse>.self).data.toDomain()
    }
    
    func getTotalGithubRank() async throws -> UpdateRank {
        try await requestGet(url: "\(Grow.baseUrl)/\(githubPath)/total", res: BaseResponse<UpdateRankResponse>.self).data.toDomain()
    }
    
    func getTodayGithubRank() async throws -> UpdateRank {
        try await requestGet(url: "\(Grow.baseUrl)/\(githubPath)/today", res: BaseResponse<UpdateRankResponse>.self).data.toDomain()
    }
    
    func getWeekSolvedacRank() async throws -> UpdateRank {
        try await requestGet(url: "\(Grow.baseUrl)/\(solvedacPath)/week", res: BaseResponse<UpdateRankResponse>.self).data.toDomain()
    }
    
    func getTotalSolvedacRank() async throws -> UpdateRank {
        try await requestGet(url: "\(Grow.baseUrl)/\(solvedacPath)/total", res: BaseResponse<UpdateRankResponse>.self).data.toDomain()
    }
    
    func getTodaySolvedacRank() async throws -> UpdateRank {
        try await requestGet(url: "\(Grow.baseUrl)/\(solvedacPath)/today", res: BaseResponse<UpdateRankResponse>.self).data.toDomain()
    }
}
