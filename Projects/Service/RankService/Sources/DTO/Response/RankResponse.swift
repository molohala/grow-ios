import RankServiceInterface

public struct GithubRankResponse: Decodable {
    let memberId: Int
    let rank: Int
    let commits: Int
}

extension GithubRankResponse {
    func toDomain() -> GithubRank {
        GithubRank(memberId: memberId, rank: rank, commits: commits)
    }
}
