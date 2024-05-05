import BaseService
import RankServiceInterface

class RankDataSourceImpl: BaseRemoteDataSource<RankDataSourceImpl>, RankDataSource {
    private let githubPath = "rank/github"
    private let solvedacPath = "rank/solvedac"
    
    func getWeekGithubRank() async throws -> [Rank] {
        try await requestGet(url: "\(Grow.baseUrl)/\(githubPath)/week", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTotalGithubRank() async throws -> [Rank] {
        try await requestGet(url: "\(Grow.baseUrl)/\(githubPath)/total", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTodayGithubRank() async throws -> [Rank] {
        try await requestGet(url: "\(Grow.baseUrl)/\(githubPath)/today", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getWeekSolvedacRank() async throws -> [Rank] {
        try await requestGet(url: "\(Grow.baseUrl)/\(solvedacPath)/week", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTotalSolvedacRank() async throws -> [Rank] {
        try await requestGet(url: "\(Grow.baseUrl)/\(solvedacPath)/total", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
    
    func getTodaySolvedacRank() async throws -> [Rank] {
        try await requestGet(url: "\(Grow.baseUrl)/\(solvedacPath)/today", res: BaseResponse<[RankResponse]>.self).data.map { $0.toDomain() }
    }
}
